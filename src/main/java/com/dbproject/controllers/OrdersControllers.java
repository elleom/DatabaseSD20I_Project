package com.dbproject.controllers;

import com.dbproject.repositories.OrderRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
