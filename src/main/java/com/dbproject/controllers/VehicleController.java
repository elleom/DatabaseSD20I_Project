package com.dbproject.controllers;

import com.dbproject.entities.Vehicle;
import com.dbproject.repositories.LocationRepository;
import com.dbproject.repositories.MakeRepository;
import com.dbproject.repositories.ModelRepository;
import com.dbproject.repositories.VehiclesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VehicleController {

    private final VehiclesRepository vehiclesRepositor;
    private final LocationRepository locationRepository;
    private final ModelRepository modelRepository;
    private final MakeRepository makeRepository;

    public VehicleController(VehiclesRepository vehiclesRepositor, LocationRepository locationRepository, ModelRepository modelRepository, MakeRepository makeRepository) {
        this.vehiclesRepositor = vehiclesRepositor;
        this.locationRepository = locationRepository;
        this.modelRepository = modelRepository;
        this.makeRepository = makeRepository;
    }

    @RequestMapping({"/vehicles","/vehicles/index.html","/vehicles/index"})
    public String getVehicleList(Model model){

        model.addAttribute("vehicles", vehiclesRepositor.findAll());
        return "vehicles/newVehicle";
    }

    @RequestMapping({"/newVehicle","/newVehicle/index.html","/newVehicle/index"})
    public String newVehicle(Model model){
        Vehicle vehicle = new Vehicle();
        model.addAttribute("newVehicle", vehicle);
        model.addAttribute("locations", locationRepository.findAll());
        model.addAttribute("models", modelRepository.findAll());
        model.addAttribute("makes", makeRepository.findAll());
        return "/vehicles/newVehicle";
    }

    @PostMapping("/saveVehicle")
    public String saveVehicle(@ModelAttribute("newVehicle") Vehicle vehicle){ //Model attribute bids the form data to the object
        //save vehicle to db
        vehiclesRepositor.save(vehicle);

        return "/regSuccess";

    }

}
