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
    private Double avgSandCargoDisk;
    private Double avgSandCargoBall;
    private Double avgSandRocketBall;
    private Double avgSandRocketDisk;
    private Double avgTeleCargoDisk;
    private Double avgTeleCargoBall;
    private Double avgTeleRocketBall;
    private Double avgTeleRocketDisk;
    private Double percentSandCrossLine;
    private Double avgDroppedTeleGamePieces;
    private Double avgTeleDefensePlays;
    private Integer mostCommonSandHabLevelStart;
}