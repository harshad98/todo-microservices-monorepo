package org.example.authservice.service;

import lombok.RequiredArgsConstructor;
import org.example.authservice.dto.LoginRequest;
import org.example.authservice.dto.LoginResponse;
import org.example.authservice.dto.RegisterRequest;
import org.example.authservice.entity.User;
import org.example.authservice.repository.UserRepository;
import org.example.authservice.security.JwtService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public String register(
            RegisterRequest request
    ) {

        if (userRepository.existsByUsername(
                request.getUsername())) {

            return "Username already exists";
        }

        if (userRepository.existsByEmail(
                request.getEmail())) {

            return "Email already exists";
        }

        User user = User.builder()
                .username(
                        request.getUsername())
                .email(
                        request.getEmail())
                .password(
                        passwordEncoder.encode(
                                request.getPassword()))
                .build();

        userRepository.save(user);

        return "User Registered Successfully";
    }

    public LoginResponse login(
            LoginRequest request
    ) {

        User user =
                userRepository
                        .findByUsername(
                                request.getUsername())
                        .orElseThrow(
                                () ->
                                        new RuntimeException(
                                                "User not found"));

        boolean matches =
                passwordEncoder.matches(
                        request.getPassword(),
                        user.getPassword());

        if (!matches) {
            throw new RuntimeException(
                    "Invalid password");
        }

        String token =
                jwtService.generateToken(
                        user.getId());

        return new LoginResponse(
                user.getId(),
                user.getUsername(),
                token
        );
    }
}