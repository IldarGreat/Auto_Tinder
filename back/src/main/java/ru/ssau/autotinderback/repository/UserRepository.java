package ru.ssau.autotinderback.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.ssau.autotinderback.model.entitie.User;


public interface UserRepository extends JpaRepository<User, Integer> {
    User findByLogin(String login);
}
