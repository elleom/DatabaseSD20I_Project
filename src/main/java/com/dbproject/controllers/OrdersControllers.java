package com.dbproject.controllers;

import com.dbproject.entities.Order;
import com.dbproject.entities.Users;
import com.dbproject.entities.Vehicle;
import com.dbproject.repositories.OrderRepository;
import com.dbproject.repositories.PaymentTypeRepository;
import com.dbproject.repositories.UsersRepository;
import com.dbproject.repositories.VehiclesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Calendar;

@Controller
public class OrdersControllers {

    private final OrderRepository orderRepository;
    private final VehiclesRepository vehiclesRepository;
    private final PaymentTypeRepository paymentTypeRepository;
    private final UsersRepository usersRepository;

    public OrdersControllers(OrderRepository orderRepository, VehiclesRepository vehiclesRepository, PaymentTypeRepository paymentTypeRepository, UsersRepository usersRepository) {
        this.orderRepository = orderRepository;
        this.vehiclesRepository = vehiclesRepository;
        this.paymentTypeRepository = paymentTypeRepository;
        this.usersRepository = usersRepository;
    }

    @RequestMapping({"/orders", "/orders/index", "/orders/index.html"})
    public String ordersList(Model model){
        model.addAttribute("orders", orderRepository.findAll());
        return "orders/list";
    }

    @RequestMapping("/orders/show/{id}")
    public String orderbyId(@PathVariable Long id, Model model){
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

    @PostMapping("/saveOrder/{id}")
    public String newOrder(@PathVariable Long id,@ModelAttribute("newOrder") Order order, HttpServletRequest request){

        Vehicle vehicle = vehiclesRepository.findById(id).get();
        Users user = retrieveUser(request);
        order.setBuyer(user);
        order.setDate(Calendar.getInstance().getTime());
        order.setVehicle(vehicle);
        order.setSeller(vehicle.getUser());
        order.setValue(vehicle.getValue());

        orderRepository.save(order);


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
