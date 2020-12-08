package com.dbproject.repositories;

import com.dbproject.entities.Order;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface OrderRepository extends CrudRepository<Order, Long> {

    /*
    @Query("select o from Order o")
    Iterable<Order> findBySellerId();
    */
    //@Query("select o from Order o where o.buyer.id = :id")
    //Set<Order> findByBuyerId(@Param("id") Long id);

}
