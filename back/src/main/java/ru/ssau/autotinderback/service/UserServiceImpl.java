package ru.ssau.autotinderback.service;

import org.springframework.web.multipart.MultipartFile;
import ru.ssau.autotinderback.model.dto.request.LoginDto;
import ru.ssau.autotinderback.model.dto.request.UserPatchRequest;
import ru.ssau.autotinderback.model.dto.request.UserRequest;
import ru.ssau.autotinderback.model.dto.response.AuthDto;
import ru.ssau.autotinderback.model.dto.response.PhotoDto;
import ru.ssau.autotinderback.model.dto.response.UserResponse;
import ru.ssau.autotinderback.model.entitie.Role;
import ru.ssau.autotinderback.service.service.UserService;

import java.util.UUID;

public class UserServiceImpl implements UserService {
    @Override
    public AuthDto register(UserRequest userRequest) {
        return null;
    }

    @Override
    public AuthDto login(LoginDto loginDto) {
        return null;
    }

    @Override
    public Void delete() {
        return null;
    }

    @Override
    public UserResponse patch(UserPatchRequest userPatchRequest){
        return null;
    }

    @Override
    public UserResponse get() {
        return null;
    }

    @Override
    public Void subscription(Role role) {
        return null;
    }

    @Override
    public PhotoDto addPhoto(MultipartFile image) {
        return null;
    }

    @Override
    public Void verifyAccount(UUID verificationToken) {
        return null;
    }
}
