package ru.ssau.autotinderback.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.ssau.autotinderback.model.entitie.User;

import java.util.UUID;


public interface UserRepository extends JpaRepository<User, UUID> {
    User findByLogin(String login);
}
