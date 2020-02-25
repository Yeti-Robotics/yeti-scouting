package com.yetirobotics.yetiscouting.team;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * TeamList
 */
@Entity(name = "teamStats")
@Data
@AllArgsConstructor
public class TeamStats {

    @Id
    private Integer teamNumber;
    private String teamName;
    private Double percentInitiationLine;
    private Double avgScoredAuto;
    private Double avgUpperAuto;
    private Double avgLowerAuto;
    private Double percentFeeding;
    private Double avgUpperTeleop;
    private Double avgLowerTeleop;
    private Double teleopAccuracy;
    private Double rotationControl;
    private Double positionControl;
    private Integer mostCommonEndPosition;
}