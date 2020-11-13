package com.dbproject.controllers;

import com.dbproject.entities.Users;
import com.dbproject.repositories.LocationRepository;
import com.dbproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;



@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;
    private LocationRepository locationRepository;

    @Autowired
    public RegistrationController(UserService userService, LocationRepository locationRepository) {
        this.userService = userService;
        this.locationRepository = locationRepository;
    }

    //returns registration template
    @RequestMapping(value = {"/register","/register.html"}, method = RequestMethod.GET)
    public String getReg(Model model){
        Users user = new Users();
        model.addAttribute("user", user);
        model.addAttribute("locations", locationRepository.findAll());

        return "/register";
    }

}
