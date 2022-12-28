package ru.ssau.autotinderback.model.dto.request;

public record UserPatchRequest(String firstName,
                               String secondName,
                               String phoneNumber) {
}
