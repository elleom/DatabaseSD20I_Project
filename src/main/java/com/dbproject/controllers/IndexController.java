package com.dbproject.controllers;

import com.dbproject.repositories.UsersRepository;
import com.dbproject.repositories.VehiclesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {


    private final VehiclesRepository vehiclesRepository;

    public IndexController(UsersRepository usersRepository, VehiclesRepository vehiclesRepository) {
        this.vehiclesRepository = vehiclesRepository;

    }

    @RequestMapping({"", "/", "index"})
    public String getIndex(Model model){
        model.addAttribute("vehicles" , vehiclesRepository.findAll());

        return "carDealerView/carDealerView";
    }
}
