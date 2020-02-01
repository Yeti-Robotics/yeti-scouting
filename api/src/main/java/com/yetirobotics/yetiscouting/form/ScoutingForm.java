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

    @Column(name = "cross_initiation_line", nullable = false)
    private Boolean crossInitiationLine;

    @Column(name = "auto_upper_scored_balls", nullable = false)
    private Integer autoUpperScoredBalls;

    @Column(name = "auto_upper_missed_balls", nullable = false)
    private Integer autoUpperMissedBalls;

    @Column(name = "auto_low_scored_balls", nullable = false)
    private Integer autoLowScoredBalls;

    @Column(name = "auto_low_missed_balls", nullable = false)
    private Integer autoLowMissedBalls;

    @Column(name = "spill_balls", nullable = false)
    private Boolean spillBalls;

    @Column(name = "teleop_upper_missed_balls", nullable = false)
    private Integer teleopUpperMissedBalls;

    @Column(name = "teleop_upper_scored_balls", nullable = false)
    private Integer teleopUpperScoredBalls;
    
    @Column(name = "teleop_low_scored_balls", nullable = false)
    private Integer teleopLowScoredBalls;

    @Column(name = "teleop_low_missed_balls", nullable = false)
    private Integer teleopLowMissedBalls;

    @Column(name = "comment", nullable = false)
    private String comment;

    @Column(name = "score", nullable = false)
    private Integer score;

    @Column(name = "preload", nullable = false)
    private Integer preload;

    @Column(name = "position_control", nullable = true)
    private Boolean positionControl;

    @Column(name = "rotation_control", nullable = true)
    private Boolean rotationControl;

    @Column(name = "end_position", nullable = true)
    private Integer endPosition;

    @CreatedBy
    @Column(name = "scouter", nullable = false)
    private String scouter;

    @Column(name = "timestamp", nullable = false)
    @LastModifiedDate
    private Date timestamp;
}