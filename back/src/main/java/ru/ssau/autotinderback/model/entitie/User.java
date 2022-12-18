package ru.ssau.autotinderback.model.entitie;

import lombok.*;

import javax.persistence.*;

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
    private Integer id;

    private String login;

    private String password;

    @Column(name = "role")
    @Enumerated(EnumType.STRING)
    private Role role;
}
