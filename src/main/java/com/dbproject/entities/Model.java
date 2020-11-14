package com.dbproject.entities;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class Model {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String code;

    @ManyToOne //dont ever forget to declare entity XD
    private Make make;

    @OneToMany
    @JoinColumn(name = "model_ID")
    private Set<Vehicle> vehicles = new HashSet<>();

    public Model() {
    }

    public Model(Long id, String name, String code, Make make) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.make = make;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Make getMake() {
        return make;
    }

    public void setMake(Make make) {
        this.make = make;
    }

    public Set<Vehicle> getVehicles() {
        return vehicles;
    }

    public void setVehicles(Set<Vehicle> vehicles) {
        this.vehicles = vehicles;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Model model = (Model) o;
        return id.equals(model.id) &&
                name.equals(model.name) &&
                code.equals(model.code) &&
                make.equals(model.make) &&
                Objects.equals(vehicles, model.vehicles);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, code, make, vehicles);
    }
}
