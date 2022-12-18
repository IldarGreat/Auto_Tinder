package ru.ssau.autotinderback.model.entitie;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "photos")
public class Photo {
    @Id
    private Integer id;
    @Column(name = "photo_link", nullable = false)
    private String photoLink;
}
