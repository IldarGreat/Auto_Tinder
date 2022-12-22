package ru.ssau.autotinderback.service.service;

import org.springframework.web.multipart.MultipartFile;
import ru.ssau.autotinderback.model.dto.request.LoginDto;
import ru.ssau.autotinderback.model.dto.request.UserPatchRequest;
import ru.ssau.autotinderback.model.dto.request.UserRequest;
import ru.ssau.autotinderback.model.dto.response.AuthDto;
import ru.ssau.autotinderback.model.dto.response.PhotoDto;
import ru.ssau.autotinderback.model.dto.response.UserResponse;
import ru.ssau.autotinderback.model.entitie.Role;

import java.util.UUID;

public interface UserService {
    AuthDto register(UserRequest userRequest);
    AuthDto login(LoginDto loginDto);
    Void delete();
    UserResponse patch(UserPatchRequest userPatchRequest);
    UserResponse get();
    Void subscription(Role role);
    PhotoDto addPhoto(MultipartFile image);
    Void verifyAccount(UUID verificationToken);
}
