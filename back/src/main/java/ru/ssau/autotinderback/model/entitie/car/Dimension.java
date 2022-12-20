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
@Table(name = "dimensions")
public class Dimension {
    @Id
    private Integer id;

    @Column(name = "length")
    private Integer length;

    @Column(name = "height")
    private Integer height;

    @Column(name = "wheelbase")
    private Integer wheelbase;

    @Column(name = "trunk_volume")
    private Integer trunkVolume;
}
