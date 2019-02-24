package com.yetirobotics.yetiscouting.team;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
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
    query = "SELECT s.team_number AS teamNumber,"+
   "t.team_name AS teamName,"+
   "AVG(CAST (s.sandstorm_cargo_hatch_panel_count AS DOUBLE) + CAST (s.sandstorm_rocket_hatch_panel_count AS DOUBLE)) AS avgDisk,"+
   "AVG(CAST (s.sandstorm_cargo_ball_count AS DOUBLE) + CAST (s.sandstorm_rocket_ball_count AS DOUBLE)) AS avgBall,"+
   "SUM(S.DROPPED_GAME_PIECES) AS droppedGamePieces,"+
   "MAX(s.HAB_LEVEL_CLIMB) AS maxLevelClimbed,"+
   "AVG(CAST(s.DEFENSE AS DOUBLE)) AS avgDefensePlays "+
   "FROM SCOUTING_FORM s "+
   "LEFT JOIN team t ON t.team_number = s.team_number "+
   "GROUP BY s.team_number",
    resultClass = TeamList.class,
    resultSetMapping = "teamList"
)
@SqlResultSetMapping(
    name = "teamList",
    classes = {
        @ConstructorResult(targetClass = TeamList.class,
        columns = {
            @ColumnResult(name = "teamNumber", type = Integer.class),
            @ColumnResult(name = "teamName", type = String.class),
            @ColumnResult(name = "avgDisk", type = Double.class),
            @ColumnResult(name = "avgBall", type = Double.class),
            @ColumnResult(name = "droppedGamePieces", type = Integer.class),
            @ColumnResult(name = "maxLevelClimbed", type = Integer.class),
            @ColumnResult(name = "avgDefensePlays", type = Double.class),
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