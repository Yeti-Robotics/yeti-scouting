package com.yetirobotics.yetiscouting.preference;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "preference")
@Data
public class Preference {
    public static final String EVENT_KEY = "eventKey";
    public static final String TEAM_VALIDATION = "teamValidation";

    @Id
    @Column(name = "preference_name")
    private String preferenceName;

    @Column(name = "preference_value")
    private String preferenceValue;
}
