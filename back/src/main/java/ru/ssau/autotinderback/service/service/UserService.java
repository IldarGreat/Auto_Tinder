package ru.ssau.autotinderback.service.service;

import ru.ssau.autotinderback.model.dto.request.LoginDto;
import ru.ssau.autotinderback.model.dto.request.UserRequest;
import ru.ssau.autotinderback.model.dto.response.AuthDto;

public interface UserService {
    AuthDto register(UserRequest userRequest);
    AuthDto login(LoginDto loginDto);
    Void delete();
}
