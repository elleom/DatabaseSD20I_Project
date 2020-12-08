package com.dbproject.repositories;

import com.dbproject.entities.Order;
import com.dbproject.entities.Users;
import com.dbproject.entities.Vehicle;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

public interface VehiclesRepository extends CrudRepository<Vehicle, Long> {


}
