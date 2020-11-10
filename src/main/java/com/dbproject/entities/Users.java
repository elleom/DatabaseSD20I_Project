package com.dbproject.entities;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class Users {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)

    private Long id;
    private String userName;
    private Integer rating;
    private String password;

    @ManyToOne //important notation!
    private Location location; //many user can have one location
    private String email;

    @OneToMany
    @JoinColumn(name = "user_id")
    private Set<Vehicle> vehicles = new HashSet<>();

    protected Users() {
        //needed for JPA
    }
    //rating can be null, user start with no cars
    public Users(String userName, String password, Location location, String email) {
        this.userName = userName;
        this.password = password;
        this.location = location;
        this.email = email;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
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

    public Set<Vehicle> getVehicles() {
        return vehicles;
    }

    public void setVehicles(Set<Vehicle> vehicles) {
        this.vehicles = vehicles;
    }

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
    )
    private Set<Role> roles = new HashSet<>();

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Users users = (Users) o;
        return id.equals(users.id) &&
                userName.equals(users.userName) &&
                Objects.equals(rating, users.rating) &&
                password.equals(users.password) &&
                location.equals(users.location) &&
                email.equals(users.email) &&
                Objects.equals(vehicles, users.vehicles);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userName, rating, password, location, email, vehicles);
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
