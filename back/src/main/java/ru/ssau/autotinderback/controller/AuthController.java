package ru.ssau.autotinderback.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.ssau.autotinderback.model.dto.request.LoginDto;
import ru.ssau.autotinderback.model.dto.request.UserRequest;
import ru.ssau.autotinderback.model.dto.response.AuthDto;
import ru.ssau.autotinderback.service.service.UserService;

@RestController
@RequestMapping("/auth")
@Tag(name = "Аутентификация")
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;

    @PostMapping(value = "/login", produces = "application/json; charset=UTF-8", consumes = "application/json; charset=UTF-8")
    @Operation(summary = "Авторизация")
    public ResponseEntity<AuthDto> login(@RequestBody LoginDto loginDto) {
        return new ResponseEntity<>(userService.login(loginDto), HttpStatus.OK);
    }

    @PostMapping(value = "/register", produces = "application/json; charset=UTF-8", consumes = "application/json; charset=UTF-8")
    @Operation(summary = "Регистрация")
    public ResponseEntity<AuthDto> register(@RequestBody UserRequest userRequest) {
        return new ResponseEntity<>(userService.register(userRequest), HttpStatus.CREATED);
    }

    @PostMapping(value = "/delete", produces = "application/json; charset=UTF-8", consumes = "application/json; charset=UTF-8")
    @Operation(summary = "Авторизация")
    public ResponseEntity<Void> deleteAccount() {
        return new ResponseEntity<>(userService.delete(), HttpStatus.OK);
    }
}
