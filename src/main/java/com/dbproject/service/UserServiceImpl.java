package com.dbproject.service;

import com.dbproject.entities.Users;
import com.dbproject.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public Users findByUserName(String userName) {
        return null;
    }

    @Override
    public Iterable<Users> findAll() {
       return usersRepository.findAll();
    }

    @Override
    public void saveUser(Users user) {
        this.usersRepository.save(user);
    }
}
