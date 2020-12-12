package com.dbproject.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Audit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String type;
    private String date;
    private String user;



    private String detail;

    public Audit() {
    }

    public Audit(Long id, String type, String date, String user) {
        this.id = id;
        this.type = type;
        this.date = date;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Audit audit = (Audit) o;

        if (id != null ? !id.equals(audit.id) : audit.id != null) return false;
        if (type != null ? !type.equals(audit.type) : audit.type != null) return false;
        if (date != null ? !date.equals(audit.date) : audit.date != null) return false;
        if (user != null ? !user.equals(audit.user) : audit.user != null) return false;
        return detail != null ? detail.equals(audit.detail) : audit.detail == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (detail != null ? detail.hashCode() : 0);
        return result;
    }
}
