package com.yetirobotics.yetiscouting.preference;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "preference")
@Data
public class Preference {
    @Id
    @Column(name = "preference_name")
    private String preferenceName;

    @Column(name = "preference_value")
    private String preferenceValue;
}
