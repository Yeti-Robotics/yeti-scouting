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
    "AVG(s.auto_low_scored_balls) AS avgLowerAuto " + 
    "FROM scouting_form s " +
    "LEFT JOIN team t ON t.team_number = s.team_number " +
    "GROUP BY s.team_number",
    resultClass = TeamList.class,
    resultSetMapping = "teamList"
)

@NamedNativeQuery(
    name = "Team.teamStats",
    query = "   SELECT s.team_number AS teamNumber,  " +
        "   t.team_name AS teamName  " +
        "   FROM scouting_form s  " +
        "   LEFT JOIN team t ON t.team_number = s.team_number  " +
        "   WHERE s.team_number = :teamNumber  " +
        "   GROUP BY s.team_number  ",
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
                @ColumnResult(name = "avgLowerAuto", type = Double.class)
            })
    }
)

@SqlResultSetMapping(
    name = "teamStats",
    classes = {
        @ConstructorResult(targetClass = TeamStats.class,
            columns = {
                @ColumnResult(name = "teamNumber", type = Integer.class),
                @ColumnResult(name = "teamName", type = String.class)
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