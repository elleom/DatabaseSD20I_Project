package com.dbproject.entities;

import javax.persistence.*;
import java.util.Date;


@Entity
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Date date;
    private Long value;

    @OneToOne
    private Users buyer;

    @OneToOne
    private Users seller;

    @OneToOne
    private Vehicle vehicle;

    public Order(Long id, Date date, Long value, Users buyer, Users seller, Vehicle vehicle) {
        this.id = id;
        this.date = date;
        this.value = value;
        this.buyer = buyer;
        this.seller = seller;
        this.vehicle = vehicle;
    }

    public Order() {

    }

    //TODO create lombok annotation

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (id != null ? !id.equals(order.id) : order.id != null) return false;
        if (date != null ? !date.equals(order.date) : order.date != null) return false;
        if (value != null ? !value.equals(order.value) : order.value != null) return false;
        if (buyer != null ? !buyer.equals(order.buyer) : order.buyer != null) return false;
        if (seller != null ? !seller.equals(order.seller) : order.seller != null) return false;
        return vehicle != null ? vehicle.equals(order.vehicle) : order.vehicle == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (value != null ? value.hashCode() : 0);
        result = 31 * result + (buyer != null ? buyer.hashCode() : 0);
        result = 31 * result + (seller != null ? seller.hashCode() : 0);
        result = 31 * result + (vehicle != null ? vehicle.hashCode() : 0);
        return result;
    }
}
