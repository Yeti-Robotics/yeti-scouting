package com.yetirobotics.yetiscouting.team;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * TeamList
 */
@Entity(name = "teamList")
@Data
@AllArgsConstructor
public class TeamList {

    @Id
    private Integer teamNumber;
    private String teamName;
    // private Integer totalScoredAUto;
    // private Integer totalUpperAuto;
    // private Integer totalLowerAuto;
    // private Double percentFeeding;
    // private Integer totalUpperTeleop;
    // private Integer totalLowerTeleop;
    // private Double teleopAccuracy;
    // private Double rotationControl;
    // private Double positionControl;
    // private Integer mostCommonEndPosition;
}