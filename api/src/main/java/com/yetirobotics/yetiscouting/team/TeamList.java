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
    private Double avgSandstormDisks;
    private Double avgDisk;
    private Double avgSandstormBalls;
    private Double avgBall;
    private Double avgClimbLevel;
    private Integer climbLevelMode;
    private Integer droppedGamePieces;
    private Double avgDefensePlays;
    private Integer totalBalls;
    private Integer totalDisks;
}