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
@Table(name = "transmissions")
public class Transmission {
    @Id
    private Integer id;

    @Column(name = "drive_unit")
    private Integer driveUnit;

    @Column(name = "transmission_type")
    @Enumerated(EnumType.STRING)
    private TransmissionType transmissionType;
}
