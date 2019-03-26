package com.yetirobotics.yetiscouting.form;

import javax.persistence.*;

import lombok.Data;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.util.Date;

/**
 * ScoutingForm
 */
@Entity
@Table(name = "scouting_form")
@Data
@EntityListeners(AuditingEntityListener.class)
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

    @Column(name = "hab_level_start", nullable = false)
    private Integer habLevelStart;

    @Column(name = "sandstorm_cargo_hatch_panel_count", nullable = false)
    private Integer sandstormCargoHatchPanelCount;

    @Column(name = "sandstorm_cargo_ball_count", nullable = false)
    private Integer sandstormCargoBallCount;

    @Column(name = "sandstorm_rocket_hatch_panel_count", nullable = false)
    private Integer sandstormRocketHatchPanelCount;

    @Column(name = "sandstorm_rocket_ball_count", nullable = false)
    private Integer sandstormRocketBallCount;

    @Column(name = "teleop_cargo_hatch_panel_count", nullable = false)
    private Integer teleopCargoHatchPanelCount;

    @Column(name = "teleop_cargo_ball_count", nullable = false)
    private Integer teleopCargoBallCount;
    
    @Column(name = "teleop_rocket_hatch_panel_count", nullable = false)
    private Integer teleopRocketHatchPanelCount;

    @Column(name = "teleop_rocket_ball_count", nullable = false)
    private Integer teleopRocketBallCount;

    @Column(name = "comment", nullable = false)
    private String comment;

    @Column(name = "score", nullable = false)
    private Integer score;

    @Column(name = "hab_level_climb", nullable = false)
    private Integer habLevelClimb;

    @Column(name = "defense", nullable = true)
    private Boolean defense;

    @Column(name = "preload", nullable = true)
    private Integer preload;

    @Column(name = "climb_time", nullable = true)
    private Integer climbTime;

    @Column(name = "buddy_climb", nullable = true)
    private Boolean buddyClimb;

    @Column(name = "lifted", nullable = true)
    private Boolean lifted;

    @Column(name = "got_lifted", nullable = true)
    private Boolean gotLifted;
    
    @Column(name = "dropped_game_pieces", nullable = true)
    private Integer droppedGamePieces;

    @Column(name = "rocket_level", nullable = true)
    private Integer rocketLevel;

    @CreatedBy
    @Column(name = "scouter", nullable = false)
    private String scouter;

    @Column(name = "timestamp", nullable = false)
    @LastModifiedDate
    private Date timestamp;
}