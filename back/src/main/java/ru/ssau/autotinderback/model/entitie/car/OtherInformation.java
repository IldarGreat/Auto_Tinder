package ru.ssau.autotinderback.model.entitie.car;


import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "other_informations")
public class OtherInformation {
    @Id
    private Integer id;

    @Column(name = "body")
    private String body;

    @Column(name = "equipment")
    private String equipment;

    @Column(name = "number_of_doors")
    private Integer numberOfDoors;

    @Column(name = "year")
    private Date year;
}
