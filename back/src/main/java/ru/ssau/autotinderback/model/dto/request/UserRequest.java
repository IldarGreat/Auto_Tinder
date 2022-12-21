package ru.ssau.autotinderback.model.dto.request;

import java.sql.Date;

public record UserRequest (String login,
                           String password,
                           String firstName,
                           String secondName,
                           String lifeStory,
                           String email,
                           Date dateOfBirth,
                           String phoneNumber){}
