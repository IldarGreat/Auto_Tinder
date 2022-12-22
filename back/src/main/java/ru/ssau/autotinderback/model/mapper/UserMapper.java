package ru.ssau.autotinderback.model.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.MappingTarget;
import org.mapstruct.NullValuePropertyMappingStrategy;
import ru.ssau.autotinderback.model.dto.request.UserPatchRequest;
import ru.ssau.autotinderback.model.dto.request.UserRequest;
import ru.ssau.autotinderback.model.dto.response.UserResponse;
import ru.ssau.autotinderback.model.entitie.User;

@Mapper(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE, componentModel = "spring")
public interface UserMapper {
    User toEntity(UserRequest userRequest);

    User toEntity(UserPatchRequest userPatch, @MappingTarget User user);

    UserResponse toResponse(User user);
}
