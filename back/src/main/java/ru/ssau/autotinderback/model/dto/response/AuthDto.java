package ru.ssau.autotinderback.model.dto.response;

public record AuthDto(String accessToken, String firstName, String secondName,String role,String photoId,String email,String phone) {
}
