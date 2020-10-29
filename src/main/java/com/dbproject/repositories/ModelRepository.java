package com.dbproject.repositories;

import com.dbproject.entities.Model;
import org.springframework.data.repository.CrudRepository;

public interface ModelRepository extends CrudRepository<Model, Long> {
}
