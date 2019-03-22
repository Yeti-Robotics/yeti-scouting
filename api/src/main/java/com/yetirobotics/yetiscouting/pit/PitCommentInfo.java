package com.yetirobotics.yetiscouting.pit;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.Entity;

//@Entity(name = "pitCommentInfo")
@Data
@AllArgsConstructor
public class PitCommentInfo {
    public String comment;
    public String userFirstName;
    public String userLastName;
    public String timestamp;
    public Integer userTeamNumber;
}
