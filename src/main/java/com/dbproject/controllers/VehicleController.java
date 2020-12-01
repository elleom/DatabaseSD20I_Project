package com.dbproject.controllers;

import com.dbproject.entities.Users;
import com.dbproject.entities.Vehicle;
import com.dbproject.repositories.*;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;

@Controller
public class VehicleController {

    private final UsersRepository usersRepository;

    private final VehiclesRepository vehiclesRepositor;
    private final LocationRepository locationRepository;
    private final ModelRepository modelRepository;
    private final MakeRepository makeRepository;

    public VehicleController(UsersRepository usersRepository, VehiclesRepository vehiclesRepositor, LocationRepository locationRepository, ModelRepository modelRepository, MakeRepository makeRepository) {
        this.usersRepository = usersRepository;
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

    @RequestMapping("/vehicle/delete/{id}")
    public String delVehicle(@PathVariable Long id){

        try {
            vehiclesRepositor.deleteById(id);
        }
        catch (DataIntegrityViolationException e) {
            return "misc/dataIntegrityMessage";
        }
        return "vehicles/delCar";
    }

    @PostMapping("/saveVehicle")
    public String saveVehicle(@ModelAttribute("newVehicle") Vehicle vehicle, HttpServletRequest request){ //Model attribute bids the form data to the object
        //save vehicle to db
        Users user = retriveUser(request);
        vehicle.setUser(user);
        //vehicle.setAvailable(1);
        vehiclesRepositor.save(vehicle);

        return "misc/Success";

    }

    public Users retriveUser(HttpServletRequest request) {

        String currentUserName;
        Users currentUser;
        Principal principal = request.getUserPrincipal();
        currentUserName = principal.getName();
        currentUser = usersRepository.findByUserName(currentUserName);

        return currentUser;

    }

}
