package com.dbproject.controllers;

import com.dbproject.repositories.UsersRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
    @RequestMapping("/users/{id}")
    public String getUserbyId(@PathVariable("id") Long id, Model model){
        model.addAttribute("users", usersRepository.findById(id));
        return "users/list";
    }

}
