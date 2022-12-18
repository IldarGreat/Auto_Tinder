package ru.ssau.autotinderback.security.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import ru.ssau.autotinderback.model.entitie.Role;

import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.time.Instant;
import java.util.Base64;
import java.util.Date;

@Component
public class JwtTokenProvider {
    private final String base64Secret;
    private final Duration expirationTime;

    public JwtTokenProvider(@Value("${application.auth.jwt-secret}") String secretKey,
                            @Value("${application.auth.jwt-expiration-time}") Duration expirationTime) {
        this.base64Secret =
                Base64.getEncoder().encodeToString(secretKey.getBytes(StandardCharsets.UTF_8));
        this.expirationTime = expirationTime;
    }

    public String createToken(String login, Role role) {
        Claims claims = Jwts.claims().setSubject(login);
        claims.put("role", role.toString());
        Instant issuedAt = Instant.now();
        Instant expireAt = issuedAt.plus(this.expirationTime);
        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(Date.from(issuedAt))
                .setExpiration(Date.from(expireAt))
                .signWith(SignatureAlgorithm.HS256, base64Secret)
                .compact();
    }

    public JwtUser validateToken(String token) {
        Jws<Claims> claimsJws = Jwts.parser().setSigningKey(base64Secret).parseClaimsJws(token);
        if (!claimsJws.getBody().getExpiration().before(new Date())) {
            return new JwtUser(getLogin(token), getRole(token));
        }
        return null;
    }

    public String getLogin(String token) {
        return Jwts.parser().setSigningKey(base64Secret).parseClaimsJws(token).getBody().getSubject();
    }

    public Role getRole(String token) {
        return Role.valueOf(Jwts.parser()
                .setSigningKey(base64Secret)
                .parseClaimsJws(token)
                .getBody().get("role").toString());
    }

}