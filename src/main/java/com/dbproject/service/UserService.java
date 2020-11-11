package com.dbproject.service;

import com.dbproject.entities.Users;
import com.dbproject.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserService {

    private UsersRepository usersRepository;

    @Autowired
    public UserService(UsersRepository usersRepository){
        this.usersRepository = usersRepository;
    }

    public Users findByUserName(String userName){
        return usersRepository.findByUserName(userName);
    }

    public void saveUser(Users user) {
        usersRepository.save(user);
    }
}
