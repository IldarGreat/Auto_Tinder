package ru.ssau.autotinderback.model.entitie.car;

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
@Table(name = "suspensions_and_brakes")
public class SuspensionAndBrake {
    @Id
    private Integer id;

    @Column(name = "front_suspension")
    private String frontSuspension;

    @Column(name = "back_suspension")
    private String backSuspension;

    @Column(name = "front_brakes")
    private String frontBrakes;

    @Column(name = "back_brakes")
    private String backBrakes;
}
