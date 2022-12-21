package ru.ssau.autotinderback.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.ssau.autotinderback.model.dto.request.UserPatchRequest;
import ru.ssau.autotinderback.model.dto.response.PhotoDto;
import ru.ssau.autotinderback.model.dto.response.UserResponse;
import ru.ssau.autotinderback.model.entitie.Role;
import ru.ssau.autotinderback.service.service.UserService;

@RestController
@RequestMapping("/users")
@Tag(name = "Действия связанные с пользователем")
@RequiredArgsConstructor
@PreAuthorize("hasAnyAuthority('USUAL','PLUS','GOLD','PLATINUM','ADMIN')")
public class UserController {
    private final UserService userService;

    @PatchMapping(produces = "application/json; charset=UTF-8", consumes = "application/json; charset=UTF-8")
    @Operation(summary = "Изменение пользователя")
    public ResponseEntity<UserResponse> patch(@RequestBody UserPatchRequest userPatchRequest) {
        return new ResponseEntity<>(userService.patch(userPatchRequest), HttpStatus.OK);
    }

    @PostMapping(value = "photo", consumes = "multipart/form-data")
    @Operation(summary = "Добавить фотографии к пользователю")
    public ResponseEntity<PhotoDto> addPhoto(@RequestPart MultipartFile image) {
        return new ResponseEntity<>(userService.addPhoto(image), HttpStatus.OK);
    }

    @GetMapping(produces = "application/json; charset=UTF-8")
    @Operation(summary = "Получение пользователя")
    public ResponseEntity<UserResponse> getUser() {
        return new ResponseEntity<>(userService.get(), HttpStatus.OK);
    }

    @PostMapping
    @Operation(summary = "Подключение подписки")
    public ResponseEntity<Void> subscription(@RequestBody Role role) {
        return new ResponseEntity<>(userService.subscription(role), HttpStatus.OK);
    }

}
