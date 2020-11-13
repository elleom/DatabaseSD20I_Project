package com.dbproject.service;

import com.dbproject.entities.Users;
import org.springframework.stereotype.Service;

@Service("userService")
public interface UserService {

    Users findByUserName(String userName);
    Iterable<Users> findAll();
    void saveUser(Users user);

}
