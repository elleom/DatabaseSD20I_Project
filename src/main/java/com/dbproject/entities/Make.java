package com.dbproject.entities;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Make {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String code;
    private String name;

    @OneToMany
    @JoinColumn(name = "makeID")
    private Set<Model> models = new HashSet<>();

    public Make() {
    }

    public Make(Long id, String code, String name, Set<Model> models) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.models = models;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Model> getModels() {
        return models;
    }

    public void setModels(Set<Model> models) {
        this.models = models;
    }
}
