package com.dbproject.entities;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Location {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private int postalCode;

    @OneToMany
    @JoinColumn(name= "location_ID") //where is it represented??
    private Set<Users> users = new HashSet();

    @OneToMany
    @JoinColumn(name= "locationID")
    private Set<Vehicle> vehicles = new HashSet<>();

    public Location() {

    }

    public Location(Long id, String name, int postalCode) {
        this.id = id;
        this.name = name;
        this.postalCode = postalCode;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(int postalCode) {
        this.postalCode = postalCode;
    }

    public Set<Users> getUsers() {
        return users;
    }

    public void setUsers(Set<Users> users) {
        this.users = users;
    }
}
