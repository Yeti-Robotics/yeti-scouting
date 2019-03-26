package com.yetirobotics.yetiscouting.tba.match;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Match {

    private Alliances alliances;

    @JsonProperty(value = "comp_level", access = Access.WRITE_ONLY)
    private String compLevel;

    @JsonProperty("match_number")
    private int matchNumber;

    @JsonIgnore
    public boolean isQual() {
        return compLevel.equalsIgnoreCase("qm");
    }
}
