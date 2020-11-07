package com.dbproject.repositories;

import com.dbproject.entities.PaymentType;
import org.springframework.data.repository.CrudRepository;

public interface PaymentTypeRepository extends CrudRepository<PaymentType, Long> {
}
