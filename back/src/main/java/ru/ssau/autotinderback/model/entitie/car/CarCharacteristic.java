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
@Table(name = "car_characteristics")
public class CarCharacteristic {
    @Id
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "engine_id")
    private Engine engine;

    @ManyToOne
    @JoinColumn(name = "transmission_id")
    private Transmission transmission;

    @ManyToOne
    @JoinColumn(name = "suspension_and_brake_id")
    private SuspensionAndBrake suspensionAndBrake;

    @ManyToOne
    @JoinColumn(name = "dimension_id")
    private Dimension dimension;

    @ManyToOne
    @JoinColumn(name = "otherInformation_id")
    private OtherInformation otherInformation;
}
