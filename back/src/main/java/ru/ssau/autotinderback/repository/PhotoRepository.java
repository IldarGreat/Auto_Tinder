package ru.ssau.autotinderback.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.ssau.autotinderback.model.entitie.Photo;

public interface PhotoRepository extends JpaRepository<Photo,Integer> {
}
