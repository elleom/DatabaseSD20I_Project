package com.dbproject.repositories;

import com.dbproject.entities.Vehicle;
import org.springframework.data.repository.CrudRepository;

public interface VehiclesRepository extends CrudRepository<Vehicle, Long> {
}
