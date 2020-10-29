package com.dbproject.repositories;

import com.dbproject.entities.Audit;
import org.springframework.data.repository.CrudRepository;

public interface AuditRepository extends CrudRepository<Audit, Long> {
}
