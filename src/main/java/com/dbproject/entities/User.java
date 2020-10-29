package com.dbproject.entities;

import javax.persistence.*;

@Entity
public class Users {
    private int id;
    private String userName;
    private Integer rating;
    private String password;

    @ManyToOne //important notation!
    private Location location; //many user can have one location
    private String email;


    protected Users() {
        //needed for JPA
    }

    public Users(String userName, String password, Location location, String email) {
        this.userName = userName;
        this.password = password;
        this.location = location;
        this.email = email;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Id
    public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
