package com.yetirobotics.yetiscouting.team;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Team
 */
@Entity
@Table(name = "team")
public class Team {
    
    @Id
    private Integer teamNumber;

    @Column(nullable = false)
    private String name;
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @return the teamNumber
     */
    public Integer getTeamNumber() {
        return teamNumber;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @param teamNumber the teamNumber to set
     */
    public void setTeamNumber(Integer teamNumber) {
        this.teamNumber = teamNumber;
    }
}