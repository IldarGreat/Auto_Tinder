package ru.ssau.autotinderback.model.dto.response;

import ru.ssau.autotinderback.model.entitie.Role;

import java.sql.Date;
import java.util.UUID;

public record UserResponse(UUID id,
                           String login,
                           Role role,
                           String firstName,
                           String secondName,
                           String lifeStory,
                           String email,
                           Date dateOfBirth,
                           String phoneNumber,
                           PhotoDto photo) {
}
