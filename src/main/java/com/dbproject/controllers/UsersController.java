package com.dbproject.controllers;

import com.dbproject.entities.Users;
import com.dbproject.repositories.UsersRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {

    private final UsersRepository usersRepository;

    public UsersController(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
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

    @PostMapping("/saveUser")
    public void saveUser(@ModelAttribute("user") Users user){ //Model attribute bids the form data to the object
        //save user to database
        usersRepository.save(user);

    }

}
