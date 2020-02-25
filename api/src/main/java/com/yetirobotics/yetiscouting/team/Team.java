package com.yetirobotics.yetiscouting.team;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQuery;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;

import lombok.Data;

/**
 * Team
 */
@Entity
@Table(name = "team")
@Data
@NamedNativeQuery(
    name = "Team.teamList",
    query = "SELECT " +
    "s.team_number AS teamNumber, " +
    "t.team_name AS teamName, " +
    "AVG(s.auto_low_scored_balls + s.auto_upper_scored_balls) AS avgScoredAuto, " +
    "AVG(s.cross_initiation_line) AS percentInitiationLine, " + 
    "AVG(s.auto_upper_scored_balls) AS avgUpperAuto, " + 
    "AVG(s.auto_low_scored_balls) AS avgLowerAuto, " + 
    "AVG(s.spill_balls) AS percentFeeding, " + 
    "AVG(s.teleop_upper_scored_balls) AS avgUpperTeleop, " + 
    "AVG(s.teleop_low_scored_balls) AS avgLowerTeleop, " + 
    "SUM(s.teleop_low_scored_balls + s.teleop_upper_scored_balls) / SUM(s.teleop_low_missed_balls + s.teleop_low_scored_balls + s.teleop_upper_missed_balls + s.teleop_upper_scored_balls) AS teleopAccuracy, " +
    "AVG(s.position_control) AS positionControl, " + 
    "AVG(s.rotation_control) AS rotationControl, " +
    "x.mostCommonEndPosition " + 
    "FROM scouting_form s " +
    "LEFT JOIN team t ON t.team_number = s.team_number " +
    "LEFT JOIN (SELECT team_number, end_position AS mostCommonEndPosition, MAX(endPositionCount) " + 
        "FROM (SELECT team_number, end_position, COUNT(*) AS endPositionCount " + 
            "FROM scouting_form " + 
            "GROUP BY team_number, end_position " + 
            "ORDER BY team_number, endPositionCount DESC) t " + 
        "GROUP BY team_number) x ON x.team_number = s.team_number " + 
    "GROUP BY s.team_number",
    resultClass = TeamList.class,
    resultSetMapping = "teamList"
)

@NamedNativeQuery(
    name = "Team.teamStats",
    query = "SELECT "+ 
    "s.team_number AS teamNumber, "+ 
    "t.team_name AS teamName, "+
    "AVG(s.auto_low_scored_balls + s.auto_upper_scored_balls) AS avgScoredAuto, "+ 
    "AVG(s.cross_initiation_line) AS percentInitiationLine, "+ 
    "AVG(s.auto_upper_scored_balls) AS avgUpperAuto, "+ 
    "AVG(s.auto_low_scored_balls) AS avgLowerAuto, "+ 
    "AVG(s.spill_balls) AS percentFeeding, "+ 
    "AVG(s.teleop_upper_scored_balls) AS avgUpperTeleop, "+
    "AVG(s.teleop_low_scored_balls) AS avgLowerTeleop, "+
    "SUM(s.teleop_low_scored_balls + s.teleop_upper_scored_balls) / SUM(s.teleop_low_missed_balls + s.teleop_low_scored_balls + s.teleop_upper_missed_balls + s.teleop_upper_scored_balls) AS teleopAccuracy, "+
    "AVG(s.position_control) AS positionControl, "+ 
    "AVG(s.rotation_control) AS rotationControl, "+
    "x.mostCommonEndPosition "+
    "FROM scouting_form s "+
    "LEFT JOIN team t ON t.team_number = s.team_number "+
    "LEFT JOIN (SELECT team_number, end_position AS mostCommonEndPosition, MAX(endPositionCount) "+
        "FROM (SELECT team_number, end_position, COUNT(*) AS endPositionCount "+
            "FROM scouting_form "+
            "GROUP BY team_number, end_position "+
            "ORDER BY team_number, endPositionCount DESC) t "+
        "GROUP BY team_number) x ON x.team_number = s.team_number "+
    "WHERE s.team_number = :teamNumber "+
    "GROUP BY s.team_number ",
    resultClass = TeamStats.class,
    resultSetMapping = "teamStats"
)

@SqlResultSetMapping(
    name = "teamList",
    classes = {
        @ConstructorResult(targetClass = TeamList.class,
            columns = {
                @ColumnResult(name = "teamNumber", type = Integer.class),
                @ColumnResult(name = "teamName", type = String.class),
                @ColumnResult(name = "percentInitiationLine", type = Double.class),
                @ColumnResult(name = "avgScoredAuto", type = Double.class),
                @ColumnResult(name = "avgUpperAuto", type = Double.class),
                @ColumnResult(name = "avgLowerAuto", type = Double.class),
                @ColumnResult(name = "percentFeeding", type = Double.class),
                @ColumnResult(name = "avgUpperTeleop", type = Double.class),
                @ColumnResult(name = "avgLowerTeleop", type = Double.class),
                @ColumnResult(name = "teleopAccuracy", type = Double.class),
                @ColumnResult(name = "positionControl", type = Double.class),
                @ColumnResult(name = "rotationControl", type = Double.class),
                @ColumnResult(name = "mostCommonEndPosition", type = Integer.class)
            })
    }
)

@SqlResultSetMapping(
    name = "teamStats",
    classes = {
        @ConstructorResult(targetClass = TeamStats.class,
            columns = {
                @ColumnResult(name = "teamNumber", type = Integer.class),
                @ColumnResult(name = "teamName", type = String.class),
                @ColumnResult(name = "percentInitiationLine", type = Double.class),
                @ColumnResult(name = "avgScoredAuto", type = Double.class),
                @ColumnResult(name = "avgUpperAuto", type = Double.class),
                @ColumnResult(name = "avgLowerAuto", type = Double.class),
                @ColumnResult(name = "percentFeeding", type = Double.class),
                @ColumnResult(name = "avgUpperTeleop", type = Double.class),
                @ColumnResult(name = "avgLowerTeleop", type = Double.class),
                @ColumnResult(name = "teleopAccuracy", type = Double.class),
                @ColumnResult(name = "positionControl", type = Double.class),
                @ColumnResult(name = "rotationControl", type = Double.class),
                @ColumnResult(name = "mostCommonEndPosition", type = Integer.class)
            })
    }
)

public class Team {

    @Id
    @Column(name = "team_number")
    private Integer number;

    @Column(name = "team_name", nullable = false)
    private String name;

}