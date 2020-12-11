package com.dbproject.repositories;

import com.dbproject.entities.Vehicle;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;

public interface VehiclesRepository extends CrudRepository<Vehicle, Long> {

    @Query(value = "SELECT * from vehicle where Vehicle .available = 1", nativeQuery = true)
    Iterable<Vehicle> findAllAvailable();

    @Query(value = "SELECT * from vehicle join orders o on vehicle.ID = o.vehicle_ID where Vehicle .available = 0", nativeQuery = true)
    Iterable<Vehicle> findAllNotAvailable();

    @Procedure(procedureName = "makeUnavailable")
    void makeUnavailable(Long vehicleID);

}
