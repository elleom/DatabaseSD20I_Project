package com.dbproject.controllers;

import com.dbproject.repositories.PaymentTypeRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentTypeController {

    private final PaymentTypeRepository paymentTypeRepository;

    public PaymentTypeController(PaymentTypeRepository paymentTypeRepository) {
        this.paymentTypeRepository = paymentTypeRepository;
    }

    @RequestMapping({"/payment", "/payment/index", "/payment/index.html"})
    public String paymentIndex(Model model){
        model.addAttribute("payments", paymentTypeRepository.findAll() );
        return "payment/list";
    }
}
