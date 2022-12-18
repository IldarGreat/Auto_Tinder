package ru.ssau.autotinderback.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.ssau.autotinderback.model.entitie.User;
import ru.ssau.autotinderback.repository.UserRepository;

import java.util.Set;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {
    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByLogin(username);
        if (user != null) {
            return new org.springframework.security.core.userdetails.User(user.getLogin(), user.getPassword(), Set.of(new SimpleGrantedAuthority(user.getRole().toString())));
        }
        throw new UsernameNotFoundException(username);
    }
}