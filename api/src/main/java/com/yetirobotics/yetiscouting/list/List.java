package com.yetirobotics.yetiscouting.list;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;

/**
 * ScoutingForm
 */
@Entity
@Table(name = "scouting_form")
@Data
public class List {

    
    // @Id    @GeneratedValue(strategy = GenerationType.IDENTITY)    private Long id;    @Column(name = "match_number", nullable = false)private Integer matchNumber;    @Column(name = "team_number", nullable = false)private Integer teamNumber;    @Column(name = "cross_habitat_line", nullable = false)private Integer rocketLevel;

}