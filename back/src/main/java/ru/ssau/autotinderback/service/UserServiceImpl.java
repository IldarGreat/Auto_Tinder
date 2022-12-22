package ru.ssau.autotinderback.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.ssau.autotinderback.exception.NotFound;
import ru.ssau.autotinderback.model.dto.request.LoginDto;
import ru.ssau.autotinderback.model.dto.request.UserPatchRequest;
import ru.ssau.autotinderback.model.dto.request.UserRequest;
import ru.ssau.autotinderback.model.dto.response.AuthDto;
import ru.ssau.autotinderback.model.dto.response.PhotoDto;
import ru.ssau.autotinderback.model.dto.response.UserResponse;
import ru.ssau.autotinderback.model.entitie.Photo;
import ru.ssau.autotinderback.model.entitie.Role;
import ru.ssau.autotinderback.model.entitie.User;
import ru.ssau.autotinderback.model.mapper.UserMapper;
import ru.ssau.autotinderback.repository.PhotoRepository;
import ru.ssau.autotinderback.repository.UserRepository;
import ru.ssau.autotinderback.security.jwt.JwtTokenProvider;
import ru.ssau.autotinderback.service.service.UserService;

import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final JwtTokenProvider jwtTokenProvider;
    private final FirebaseService firebaseService;
    private final PhotoRepository photoRepository;

    @Override
    public AuthDto register(UserRequest userRequest) {
        log.info("Attempt to register an account with a login {}", userRequest.login());
        User user = userMapper.toEntity(userRequest);
        user.setId(UUID.randomUUID());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole(Role.USUAL);
        userRepository.save(user);
        log.info("{} successfully registered", userRequest.login());
        // Сделать отправку на почту
        return new AuthDto("Please confirm your email,a activation link has been sent to " + userRequest.email(), "", "");
    }

    @Override
    public AuthDto login(LoginDto loginDto) {
        log.info("Attempt to login {}", loginDto.login());
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(loginDto.login(), loginDto.password());
        authenticationManager.authenticate(authenticationToken);
        User user = userRepository.findByLogin(loginDto.login());
        if (!user.isEmailActivated()) {
            log.info("{} email {} not activated", loginDto.login(), user.getEmail());
            throw new IllegalArgumentException("Your email " + user.getEmail() + " not activated. Please visit activation code that has been sent to your email");
        }
        return new AuthDto(jwtTokenProvider.createToken(loginDto.login(), user.getRole()), user.getFirstName(), user.getSecondName());
    }

    @Override
    public Void delete() {
        String login = SecurityContextHolder.getContext().getAuthentication().getName();
        // пох
        return null;
    }

    @Override
    public UserResponse patch(UserPatchRequest userPatchRequest) {
        String login = SecurityContextHolder.getContext().getAuthentication().getName();
        log.info("Attempt to patch user with login {}", login);
        User user = findUserByLogin(login);
        User patchedUser = userMapper.toEntity(userPatchRequest, user);
        userRepository.save(patchedUser);
        log.info("User {} successfully patched account", login);
        return userMapper.toResponse(patchedUser);
    }

    @Override
    public UserResponse get() {
        String login = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = findUserByLogin(login);
        return userMapper.toResponse(user);
    }

    @Override
    public Void subscription(Role role) {
        String login = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = findUserByLogin(login);
        user.setRole(role);
        userRepository.save(user);
        log.info("User {} successfully changed subscription to {}", login, role.toString());
        return null;
    }

    @Override
    public PhotoDto addPhoto(MultipartFile image) {
        String login = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = findUserByLogin(login);
        log.info("User {} want add pin photo to his account", login);
        String url = firebaseService.uploadImages(image);
        Photo photo = photoRepository.save(Photo.builder().photoLink(url).build());
        user.setPhoto(photo);
        userRepository.save(user);
        log.info("User {} successfully pin photo {} to account ", login, url);
        return new PhotoDto(photo.getId(), url);
    }

    @Override
    public Void verifyAccount(UUID verificationToken) {
        User user = findUserByID(verificationToken);
        user.setEmailActivated(true);
        log.info("User {} successfully activated his email {} ", user.getLogin(), user.getEmail());
        return null;
    }

    public User findUserByID(UUID Id) {
        return userRepository.findById(Id)
                .orElseThrow(() -> new NotFound("User with id:" + Id + " not found"));
    }

    public User findUserByLogin(String login) {
        User user = userRepository.findByLogin(login);
        if (user == null) {
            throw new NotFound("User with login:" + login + " not found");
        }
        return user;
    }

}
