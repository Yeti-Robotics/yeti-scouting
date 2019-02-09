package com.yetirobotics.yetiscouting.team;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * Team
 */
@Entity
@Table(name = "team")
@Data
public class Team {

    @Id
    @Column(name = "team_number")
    private Integer number;

    @Column(name = "team_name", nullable = false)
    private String name;

}