package ru.kpfu.itis.repositories;

import java.util.List;
import java.util.Optional;

public interface CrudRepository<T> {
    Optional<T> findOne(Long id);
    void save(T model);
    void delete(Long id);
    void update(T model);

    List<T> findAll();

}
