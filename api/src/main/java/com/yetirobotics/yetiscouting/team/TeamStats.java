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
}