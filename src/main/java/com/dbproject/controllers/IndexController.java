package com.dbproject.controllers;

import com.dbproject.entities.Users;
import com.dbproject.repositories.UsersRepository;
import com.dbproject.repositories.VehiclesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;


@Controller
public class IndexController {

    private String currentUserName;
    private Users currentUser;
    private final VehiclesRepository vehiclesRepository;
    private final UsersRepository usersRepository;

    public IndexController(VehiclesRepository vehiclesRepository, UsersRepository usersRepository) {

        this.vehiclesRepository = vehiclesRepository;
        this.usersRepository = usersRepository;
    }

    @RequestMapping({"", "/", "index"})
    public String getIndex(Model model, HttpServletRequest request){
        Principal principal = request.getUserPrincipal();
        currentUserName = principal.getName();
        currentUser = usersRepository.findByUserName(currentUserName);
        model.addAttribute("currentUser", currentUser);

        model.addAttribute("vehicles" , vehiclesRepository.findAll());
        return "carDealerView/carDealerView";
    }

    @RequestMapping("/login")
    public String loginPage(){
        return "public/login";
    }

    @RequestMapping("/logout")
    public String logoutPage(){
        return "public/logout";
    }
}
