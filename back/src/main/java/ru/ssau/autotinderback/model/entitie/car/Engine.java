package ru.ssau.autotinderback.model.entitie.car;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "engines")
public class Engine {
    @Id
    private Integer id;

    @Column(name = "engine_volume")
    private Integer engineVolume;

    @Column(name = "engine_type")
    @Enumerated(EnumType.STRING)
    private EngineType engineType;

    @Column(name = "cylinder_count")
    private Integer cylinderCount;

    @Column(name = "power")
    private Integer power;

    @Column(name = "torque")
    private Integer torque;
}
