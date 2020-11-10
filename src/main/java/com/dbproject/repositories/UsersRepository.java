package com.dbproject.repositories;

import com.dbproject.entities.Users;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UsersRepository extends CrudRepository<Users, Long> {

    @Query("SELECT u FROM  Users u WHERE u.userName = :username")
    Users findByUserName(@Param("username") String userName); //defines a list of Users with the same name
}
