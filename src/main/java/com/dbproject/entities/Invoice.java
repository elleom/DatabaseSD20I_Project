package com.dbproject.entities;

import org.hibernate.tuple.GeneratedValueGeneration;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Invoice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ID;
    private Date date;
    private Long amount;

    @OneToOne
    @JoinColumn(name = "order_id", referencedColumnName = "ID")
    private Order order;

    @OneToOne
    @JoinColumn(name = "user_ID", referencedColumnName = "id")
    private Users user;

    @OneToOne
    @JoinColumn(name = "payment_type_ID", referencedColumnName = "ID")
    private PaymentType paymentType;

    public Long getID() {
        return ID;
    }

    public void setID(Long ID) {
        this.ID = ID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public PaymentType getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(PaymentType paymentType) {
        this.paymentType = paymentType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Invoice invoice = (Invoice) o;

        if (ID != null ? !ID.equals(invoice.ID) : invoice.ID != null) return false;
        if (date != null ? !date.equals(invoice.date) : invoice.date != null) return false;
        if (amount != null ? !amount.equals(invoice.amount) : invoice.amount != null) return false;
        if (order != null ? !order.equals(invoice.order) : invoice.order != null) return false;
        if (user != null ? !user.equals(invoice.user) : invoice.user != null) return false;
        return paymentType != null ? paymentType.equals(invoice.paymentType) : invoice.paymentType == null;
    }

    @Override
    public int hashCode() {
        int result = ID != null ? ID.hashCode() : 0;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (amount != null ? amount.hashCode() : 0);
        result = 31 * result + (order != null ? order.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (paymentType != null ? paymentType.hashCode() : 0);
        return result;
    }
}
