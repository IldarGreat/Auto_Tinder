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
@Table(name = "like")
public class Like {
    @Id
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "liking_car_id")
    private Car likingCar;

    @ManyToOne
    @JoinColumn(name = "liked_car_id")
    private Car likedCar;

    @Column(name = "created_at", insertable = false)
    private LocalDateTime createdAt;
}
