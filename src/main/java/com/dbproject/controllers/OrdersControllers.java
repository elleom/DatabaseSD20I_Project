package com.dbproject.controllers;

import com.dbproject.customException.CarNotAvailableException;
import com.dbproject.entities.Invoice;
import com.dbproject.entities.Order;
import com.dbproject.entities.Users;
import com.dbproject.entities.Vehicle;
import com.dbproject.repositories.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.security.Principal;
import java.util.Calendar;

@Controller
public class OrdersControllers {

    private final OrderRepository orderRepository;
    private final VehiclesRepository vehiclesRepository;
    private final PaymentTypeRepository paymentTypeRepository;
    private final UsersRepository usersRepository;
    private final InvoiceRepository invoiceRepository;

    public OrdersControllers(VehiclesRepository vehiclesRepository, PaymentTypeRepository paymentTypeRepository, UsersRepository usersRepository, OrderRepository orderRepository, InvoiceRepository invoiceRepository) {

        this.vehiclesRepository = vehiclesRepository;
        this.paymentTypeRepository = paymentTypeRepository;
        this.usersRepository = usersRepository;
        this.orderRepository = orderRepository;
        this.invoiceRepository = invoiceRepository;
    }

    @RequestMapping({"/orders", "/orders/index", "/orders/index.html"})
    public String ordersList(Model model) {
        model.addAttribute("orders", orderRepository.findAll());
        return "orders/list";
    }

    @RequestMapping("/orders/show/{id}")
    public String orderbyId(@PathVariable Long id, Model model) {
        model.addAttribute("order", orderRepository.findById(id).orElse(null));

        return "orders/singleOrder";
    }

    @RequestMapping("/vehicle/order/{id}")
    public String delVehicle(@PathVariable Long id, Model mOdel) {

        Order order = new Order();
        mOdel.addAttribute("newOrder", order);
        Vehicle vehicle = vehiclesRepository.findById(id).get();
        mOdel.addAttribute("payments", paymentTypeRepository.findAll());
        mOdel.addAttribute("vehicle", vehicle);

        return "orders/newOrder";
    }

    @Transactional(rollbackOn = CarNotAvailableException.class)
    @PostMapping("/saveOrder/{id}")
    public String newOrder(@PathVariable Long id, @ModelAttribute("newOrder") Order order, HttpServletRequest request) throws CarNotAvailableException {

        Vehicle vehicle = vehiclesRepository.findById(id).get();
        Users user = retrieveUser(request);
        order.setBuyer(user);
        order.setDate(Calendar.getInstance().getTime());
        order.setVehicle(vehicle);
        order.setSeller(vehicle.getUser());
        order.setValue(vehicle.getValue());

        /** prevent a car already sold to be re order
         * LOGIC: reproduces the query to the DB, if car already declared notAvail
         * then rolls back
         */
        Vehicle temp = vehiclesRepository.findById(vehicle.getId()).get();

        orderRepository.save(order);
        //CALLS TO STORED PROCEDURE
        vehiclesRepository.makeUnavailable(id); //get the car out of the list

        //creates invoice based on order
        Invoice invoice = new Invoice();
        invoice.setDate(Calendar.getInstance().getTime());
        invoice.setOrder(order);
        invoice.setUser(order.getBuyer());
        invoiceRepository.save(invoice);


        if (temp.getAvailable() != 0) {
            throw new CarNotAvailableException("Car no longer available");
        }



        return "misc/Success";

    }

    public Users retrieveUser(HttpServletRequest request) {

        String currentUserName;
        Users currentUser;
        Principal principal = request.getUserPrincipal();
        currentUserName = principal.getName();
        currentUser = usersRepository.findByUserName(currentUserName);

        return currentUser;

    }

}
