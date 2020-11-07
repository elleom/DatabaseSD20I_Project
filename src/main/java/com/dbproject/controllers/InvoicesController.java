package com.dbproject.controllers;

import com.dbproject.repositories.InvoiceRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InvoicesController {

    private final InvoiceRepository invoiceRepository;

    public InvoicesController(InvoiceRepository invoiceRepository) {
        this.invoiceRepository = invoiceRepository;
    }

    @RequestMapping({"/invoices", "/invoices/index", "/invoices/index.html"})
    public String invoiceIndex(Model model){
        model.addAttribute("invoices", invoiceRepository.findAll() );
        return "/invoices/list";
    }
}
