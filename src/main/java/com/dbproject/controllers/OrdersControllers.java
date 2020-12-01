package com.dbproject.controllers;

import com.dbproject.entities.Order;
import com.dbproject.repositories.OrderRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class OrdersControllers {

    private final OrderRepository orderRepository;

    public OrdersControllers(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
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

    @PostMapping("/newOrder")
    public String newOrder(@ModelAttribute("newOrder") Order order, HttpServletRequest request){

        return "Success";

    }
}
