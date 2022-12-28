package ru.ssau.autotinderback.model.entitie;

import lombok.*;
import ru.ssau.autotinderback.model.entitie.car.Car;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

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
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "photo_link", nullable = false)
    private String photoLink;

    @ManyToMany(mappedBy = "photos")
    private Set<Car> cars = new HashSet<>();
}
