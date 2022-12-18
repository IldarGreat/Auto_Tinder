package ru.ssau.autotinderback.model.entitie.car;

import lombok.*;
import ru.ssau.autotinderback.model.entitie.Photo;
import ru.ssau.autotinderback.model.entitie.User;

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
@Table(name = "cars")
public class Car {
    @Id
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User userId;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private Integer price;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private CarStatus carStatus;

    @ManyToOne
    @JoinColumn(name = "car_characteristic_id")
    private CarCharacteristic carCharacteristic;

    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(
            name = "cars_photos",
            joinColumns = {@JoinColumn(name = "car_id")},
            inverseJoinColumns = {@JoinColumn(name = "photo_id")}
    )
    Set<Photo> photos = new HashSet<>();
}
