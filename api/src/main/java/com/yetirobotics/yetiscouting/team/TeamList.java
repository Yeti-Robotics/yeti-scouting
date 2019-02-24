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
    private Double avgDisk;
    private Double avgBall;
    private Integer droppedGamePieces;
    private Integer maxLevelClimbed;
    private Double avgDefensePlays;
}