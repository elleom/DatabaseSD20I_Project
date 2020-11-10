package com.dbproject.security;

import com.dbproject.entities.Users;
import com.dbproject.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyUserDetailService implements UserDetailsService {

    @Autowired
    private UsersRepository usersRepository; //notation to not instantiate the class;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

        Users user = usersRepository.findByUserName(userName);
        if (user==null){
            throw new UsernameNotFoundException("Bad Credentials");
        }

        return new UserPrincipal(user);
    }
}
