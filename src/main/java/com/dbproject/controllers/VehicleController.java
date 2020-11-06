package com.dbproject.controllers;

import com.dbproject.repositories.VehiclesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VehicleController {

    private final VehiclesRepository vehiclesRepositor;

    public VehicleController(VehiclesRepository vehiclesRepositor) {
        this.vehiclesRepositor = vehiclesRepositor;
    }

    @RequestMapping({"/vehicles","/vehicles/index.html","/vehicles/index"})
    public String getVehicleList(Model model){

        model.addAttribute("vehicles", vehiclesRepositor.findAll());
        return "vehicles/list";
    }

}
