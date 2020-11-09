package com.dbproject.repositories;

import com.dbproject.entities.Users;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UsersRepository extends CrudRepository<Users, Long> {

    List<Users> findByUserName(String userName); //defines a list of Users with the same name



}
