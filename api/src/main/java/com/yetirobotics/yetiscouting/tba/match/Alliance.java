package com.yetirobotics.yetiscouting.tba.match;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonSetter;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class Alliance {

    @JsonProperty("team_keys")
    private int[] teamKeys;

    @JsonSetter("team_keys")
    public void setTeamKeys(String[] team_keys) {
        int[] team_keys_int = new int[team_keys.length];
        for (int i = 0; i < team_keys.length; i++) {
            team_keys_int[i] = Integer.parseInt(team_keys[i].substring(3));
        }
        this.teamKeys = team_keys_int;
    }

}
