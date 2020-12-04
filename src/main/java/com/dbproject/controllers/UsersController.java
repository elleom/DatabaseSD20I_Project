package com.dbproject.controllers;

import com.dbproject.entities.Users;
import com.dbproject.repositories.LocationRepository;
import com.dbproject.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UsersController {

    @Autowired
    private final UsersRepository usersRepository;

    @Autowired
    private final LocationRepository locationRepository;

    public UsersController(UsersRepository usersRepository, LocationRepository locationRepository) {
        this.usersRepository = usersRepository;
        this.locationRepository = locationRepository;
    }

    @RequestMapping("/users")
    public String getUsers(Model model){
        model.addAttribute("users", usersRepository.findAll());
        return "users/list";
    }
    @RequestMapping("/users/show/{id}")
    public String showById(@PathVariable Long id,Model model){
        model.addAttribute("user", usersRepository.findById(id).orElse(null));
        return "users/show";
    }

    //returns registration template
    @RequestMapping(value = {"/register","/register.html"}, method = RequestMethod.GET)
    public String getReg(Model model){
        Users user = new Users();
        model.addAttribute("user", user);
        model.addAttribute("locations", locationRepository.findAll());

        return "users/register";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute("user") Users user){ //Model attribute bids the form data to the object
        //save user to database
        usersRepository.save(user);

        return "misc/Success";

    }

}
