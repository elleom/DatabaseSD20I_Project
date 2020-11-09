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
    @RequestMapping("/users/show/{id}")
    public String showById(@PathVariable Long id,Model model){
        model.addAttribute("user", usersRepository.findById(id).orElse(null));
        return "users/show";
    }

}
