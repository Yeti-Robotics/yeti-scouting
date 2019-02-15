package com.yetirobotics.yetiscouting.form;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * ScoutingForm
 */
@Entity
@Table(name = "scouting_form")
@Data
public class ScoutingForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "match_number", nullable = false)
    private Integer matchNumber;

    @Column(name = "team_number", nullable = false)
    private Integer teamNumber;

    @Column(name = "cross_habitat_line", nullable = false)
    private Boolean crossHabitatLine;

    @Column(name = "sandstorm_cargo_hatch_panel_count", nullable = false)
    private Integer sandstormCargoHatchPanelCount;

    @Column(name = "sandstorm_cargo_ball_count", nullable = false)
    private Integer sandstormCargoBallCount;

    @Column(name = "sandstorm_rocket_hatch_panel_count", nullable = false)
    private Integer sandstormRocketHatchPanelCount;

    @Column(name = "sandstorm_rocket_ball_count", nullable = false)
    private Integer sandstormRocketBallCount;

    
    
}