package com.dbproject.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;
import java.util.Optional;


@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Date date;
    private Long value;

    @OneToOne
    private Users buyer;

    @OneToOne
    private Users seller;

    @OneToOne
    private Vehicle vehicle;

    @OneToOne
    @JoinColumn(name = "payment_type_ID", referencedColumnName = "ID")
    private PaymentType paymentType;

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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getValue() {
        return value;
    }

    public void setValue(Long value) {
        this.value = value;
    }

    public Users getBuyer() {
        return buyer;
    }

    public void setBuyer(Users buyer) {
        this.buyer = buyer;
    }

    public Users getSeller() {
        return seller;
    }

    public void setSeller(Users seller) {
        this.seller = seller;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public PaymentType getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(PaymentType paymentType) {
        this.paymentType = paymentType;
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
        if (vehicle != null ? !vehicle.equals(order.vehicle) : order.vehicle != null) return false;
        return paymentType != null ? paymentType.equals(order.paymentType) : order.paymentType == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (value != null ? value.hashCode() : 0);
        result = 31 * result + (buyer != null ? buyer.hashCode() : 0);
        result = 31 * result + (seller != null ? seller.hashCode() : 0);
        result = 31 * result + (vehicle != null ? vehicle.hashCode() : 0);
        result = 31 * result + (paymentType != null ? paymentType.hashCode() : 0);
        return result;
    }


}
