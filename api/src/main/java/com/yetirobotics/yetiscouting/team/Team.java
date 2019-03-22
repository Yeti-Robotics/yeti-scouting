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
    query = "SELECT s.team_number AS teamNumber,"+
   "t.team_name AS teamName,"+
   "AVG(CAST (s.sandstorm_cargo_hatch_panel_count AS DOUBLE) + CAST (s.sandstorm_rocket_hatch_panel_count AS DOUBLE)) AS avgDisk,"+
   "AVG(CAST (s.sandstorm_cargo_ball_count AS DOUBLE) + CAST (s.sandstorm_rocket_ball_count AS DOUBLE)) AS avgBall,"+
   "SUM(S.DROPPED_GAME_PIECES) AS droppedGamePieces,"+
   "MAX(s.HAB_LEVEL_CLIMB) AS maxLevelClimbed,"+
   "AVG(CAST(s.DEFENSE AS DOUBLE)) AS avgDefensePlays,"+
    "SUM(s.sandstorm_cargo_hatch_panel_count + s.sandstorm_rocket_hatch_panel_count + s.teleop_cargo_hatch_panel_count + s.teleop_rocket_hatch_panel_count) AS totalDisks, " +
    "SUM(s.sandstorm_cargo_ball_count + s.sandstorm_rocket_ball_count + s.teleop_cargo_ball_count + s.teleop_rocket_ball_count) AS totalBalls " +
   "FROM SCOUTING_FORM s "+
    "LEFT JOIN team t ON t.team_number = s.team_number "+
   "GROUP BY s.team_number",
    resultClass = TeamList.class,
    resultSetMapping = "teamList"
)

@NamedNativeQuery(
    name = "Team.teamStats",
    query =  "   SELECT s.team_number AS teamNumber,  "  +
    "   t.team_name AS teamName,  "  +
    "   AVG(CAST (s.sandstorm_cargo_hatch_panel_count AS DOUBLE)) AS avgSandCargoDisk,  "  +
    "   AVG(CAST (s.sandstorm_rocket_hatch_panel_count AS DOUBLE)) AS avgSandRocketDisk,  "  +
    "   AVG(CAST (s.sandstorm_cargo_ball_count AS DOUBLE)) AS avgSandCargoBall,  "  +
    "   AVG(CAST (s.sandstorm_rocket_ball_count AS DOUBLE)) AS avgSandRocketBall,  "  +
    "   AVG(CAST(s.cross_habitat_line AS DOUBLE)) * 100 AS percentSandCrossLine,  "  +
    "   AVG(CAST (S.DROPPED_GAME_PIECES AS DOUBLE)) AS avgDroppedTeleGamePieces,  "  +
    "   MAX(s.HAB_LEVEL_CLIMB) AS maxTeleLevelClimbed,  "  +
    "   AVG(CAST(s.DEFENSE AS DOUBLE)) * 100 AS avgTeleDefensePlays,  "  +
    "   (SELECT hab_level_start  "  +
    "   FROM scouting_form  "  +
    "   WHERE team_number=:teamNumber  "  +
    "   GROUP BY hab_level_start  "  +
    "   ORDER BY COUNT(hab_level_start) DESC, hab_level_start DESC  "  +
    "   LIMIT 1) AS mostCommonSandHabLevelStart,  "  +
    "   AVG(CAST (s.teleop_cargo_hatch_panel_count AS DOUBLE)) AS avgTeleCargoDisk,  "  +
    "   AVG(CAST (s.teleop_rocket_hatch_panel_count AS DOUBLE)) AS avgTeleRocketDisk,  "  +
    "   AVG(CAST (s.teleop_cargo_ball_count AS DOUBLE)) AS avgTeleCargoBall,  "  +
    "   AVG(CAST (s.teleop_rocket_ball_count AS DOUBLE)) AS avgTeleRocketBall  "  +
    "   FROM SCOUTING_FORM s  "  +
    "   LEFT JOIN team t ON t.team_number = s.team_number  "  +
    "   WHERE s.team_number = :teamNumber  "  +
    "  GROUP BY s.team_number  ",
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
            @ColumnResult(name = "avgDisk", type = Double.class),
            @ColumnResult(name = "avgBall", type = Double.class),
            @ColumnResult(name = "droppedGamePieces", type = Integer.class),
            @ColumnResult(name = "maxLevelClimbed", type = Integer.class),
            @ColumnResult(name = "avgDefensePlays", type = Double.class),
            @ColumnResult(name = "totalBalls", type = Integer.class),
            @ColumnResult(name = "totalDisks", type = Integer.class)
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
            @ColumnResult(name = "avgSandCargoDisk", type = Double.class),
            @ColumnResult(name = "avgSandCargoBall", type = Double.class),
            @ColumnResult(name = "avgSandRocketBall", type = Double.class),
            @ColumnResult(name = "avgSandRocketDisk", type = Double.class),
            @ColumnResult(name = "avgTeleCargoDisk", type = Double.class),
            @ColumnResult(name = "avgTeleCargoBall", type = Double.class),
            @ColumnResult(name = "avgTeleRocketBall", type = Double.class),
            @ColumnResult(name = "avgTeleRocketDisk", type = Double.class),
            @ColumnResult(name = "percentSandCrossLine", type = Double.class),
            @ColumnResult(name = "avgDroppedTeleGamePieces", type = Double.class),
            @ColumnResult(name = "avgTeleDefensePlays", type = Double.class),
            @ColumnResult(name = "mostCommonSandHabLevelStart", type = Integer.class),
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
