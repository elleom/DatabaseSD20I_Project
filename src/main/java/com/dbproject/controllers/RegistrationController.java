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

    private UserService userService;
    private LocationRepository locationRepository;

    @Autowired
    public RegistrationController(UserService userService, LocationRepository locationRepository) {
        this.userService = userService;
        this.locationRepository = locationRepository;
    }

    //returns registration template
    @RequestMapping(value = {"/register","/register.html"}, method = RequestMethod.GET)
    public ModelAndView getReg(ModelAndView model, Users user){
        model.addObject("user", user);
        model.addObject("locations", locationRepository.findAll());
        model.setViewName("register");

        return model;
    }
    // Process form input data
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView processRegistrationForm(ModelAndView modelAndView, Users user, BindingResult bindingResult, HttpServletRequest request) {

        // Lookup user in database by e-mail
        Users userExists = userService.findByUserName(user.getUserName());

        System.out.println(userExists);

        if (userExists != null) {
            modelAndView.addObject("alreadyRegisteredMessage", "Oops!  There is already a user registered with the email provided.");
            modelAndView.setViewName("register");
            bindingResult.reject("userName");
        }

        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("register");
        } else {
            userService.saveUser(user);
            String appUrl = request.getScheme() + "://" + request.getServerName();
            modelAndView.setViewName("register");
        }
        return modelAndView;
    }

}
