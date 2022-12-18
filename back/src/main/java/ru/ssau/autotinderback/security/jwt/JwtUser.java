package ru.ssau.autotinderback.security.jwt;

import ru.ssau.autotinderback.model.entitie.Role;

public record JwtUser(String login, Role role) {
}
