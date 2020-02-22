package com.yetirobotics.yetiscouting.pit;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PitDataStats {
    private String scouter
    private Int height
    private Int shooting
    private Int climbing
    private Boolean rotation_control
    private Boolean position_control
}