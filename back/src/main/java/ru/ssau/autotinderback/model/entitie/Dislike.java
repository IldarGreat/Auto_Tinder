package ru.ssau.autotinderback.model.entitie;

import lombok.*;
import ru.ssau.autotinderback.model.entitie.car.Car;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "dislikes")
public class Dislike {
    @Id
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "disliking_car_id")
    private Car dislikingCar;

    @ManyToOne
    @JoinColumn(name = "disliked_car_id")
    private Car dislikedCar;

    @Column(name = "created_at", insertable = false)
    private LocalDateTime createdAt;
}
