package com.dbproject.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Location {

    private int id;
    private String name;
    private int zipCode;

    public void setId(String id) {
        this.id = id;
    }

    @Id
    public String getId() {
        return id;
    }
}
