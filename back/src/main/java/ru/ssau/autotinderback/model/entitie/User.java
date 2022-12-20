package ru.ssau.autotinderback.model.entitie;

import lombok.*;

import javax.persistence.*;
import java.sql.Date;
import java.util.UUID;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class User {
    @Id
    private UUID id;

    @Column(name = "login")
    private String login;

    @Column(name = "password")
    private String password;

    @Column(name = "role")
    @Enumerated(EnumType.STRING)
    private Role role;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "second_name")
    private String secondName;

    @Column(name = "life_story")
    private String lifeStory;

    @Column(name = "email")
    private String email;

    @Column(name = "is_email_activated")
    private boolean isEmailActivated;

    @Column(name = "date_of_birth")
    private Date dateOfBirth;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "max_distance")
    private Integer maxDistance;

    @Column(name = "is_boost")
    private boolean isBoost;

    @ManyToOne
    @JoinColumn(name = "photo_id")
    private Photo photo;
}
