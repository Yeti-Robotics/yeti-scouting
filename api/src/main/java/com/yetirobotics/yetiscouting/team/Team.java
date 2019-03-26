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
    query = "SELECT s.team_number AS teamNumber," +
        "t.team_name AS teamName," +
        "AVG(s.sandstorm_cargo_hatch_panel_count + s.sandstorm_rocket_hatch_panel_count) AS avgSandstormDisks," +
        "AVG(s.sandstorm_cargo_hatch_panel_count + s.sandstorm_rocket_hatch_panel_count + s.teleop_cargo_hatch_panel_count + s.teleop_rocket_hatch_panel_count) AS avgDisk," +
        "AVG(s.sandstorm_cargo_ball_count + s.sandstorm_rocket_ball_count) AS avgSandstormBalls," +
        "AVG(s.sandstorm_cargo_ball_count + s.sandstorm_rocket_ball_count + s.teleop_cargo_ball_count + s.teleop_rocket_ball_count) AS avgBall," +
        "SUM(s.dropped_game_pieces) AS droppedGamePieces," +
        "AVG(s.hab_level_climb) AS avgClimbLevel, " +
        "hab_mode.climb_level_mode AS climbLevelMode," +
        "AVG(s.defense) AS avgDefensePlays," +
        "SUM(s.sandstorm_cargo_ball_count + s.sandstorm_rocket_ball_count + s.teleop_cargo_ball_count + s.teleop_rocket_ball_count) AS totalBalls," +
        "SUM(s.sandstorm_cargo_hatch_panel_count + s.sandstorm_rocket_hatch_panel_count + s.teleop_cargo_hatch_panel_count + s.teleop_rocket_hatch_panel_count) AS totalDisks " +
        "FROM scouting_form s " +
        "LEFT JOIN team t ON t.team_number = s.team_number " +
        "LEFT JOIN (SELECT c.team_number, c.hab_level_climb AS climb_level_mode " +
        "FROM (SELECT team_number, hab_level_climb, COUNT(hab_level_climb) AS climb_count " +
        "           FROM scouting_form " +
        "           GROUP BY team_number, hab_level_climb) AS c " +
        "INNER JOIN (SELECT team_number, MAX(c.climb_count) AS climb_mode " +
        "FROM (SELECT team_number, hab_level_climb, COUNT(hab_level_climb) AS climb_count " +
        "           FROM scouting_form " +
        "           GROUP BY team_number, hab_level_climb) AS c " +
        "GROUP BY team_number) AS m ON m.team_number = c.team_number AND m.climb_mode = c.climb_count) AS hab_mode ON s.team_number = hab_mode.team_number " +
        "GROUP BY s.team_number",
    resultClass = TeamList.class,
    resultSetMapping = "teamList"
)

@NamedNativeQuery(
    name = "Team.teamStats",
    query = "   SELECT s.team_number AS teamNumber,  " +
        "   t.team_name AS teamName,  " +
        "   AVG(s.sandstorm_cargo_hatch_panel_count) AS avgSandCargoDisk,  " +
        "   AVG(s.sandstorm_rocket_hatch_panel_count) AS avgSandRocketDisk,  " +
        "   AVG(s.sandstorm_cargo_ball_count) AS avgSandCargoBall,  " +
        "   AVG(s.sandstorm_rocket_ball_count) AS avgSandRocketBall,  " +
        "   AVG(s.cross_habitat_line) * 100 AS percentSandCrossLine,  " +
        "   AVG(s.dropped_game_pieces) AS avgDroppedTeleGamePieces,  " +
        "   MAX(s.hab_level_climb) AS maxTeleLevelClimbed,  " +
        "   AVG(s.defense) * 100 AS avgTeleDefensePlays,  " +
        "   (SELECT hab_level_start  " +
        "   FROM scouting_form  " +
        "   WHERE team_number=:teamNumber  " +
        "   GROUP BY hab_level_start  " +
        "   ORDER BY COUNT(hab_level_start) DESC, hab_level_start DESC  " +
        "   LIMIT 1) AS mostCommonSandHabLevelStart,  " +
        "   AVG(s.teleop_cargo_hatch_panel_count) AS avgTeleCargoDisk,  " +
        "   AVG(s.teleop_rocket_hatch_panel_count) AS avgTeleRocketDisk,  " +
        "   AVG(s.teleop_cargo_ball_count) AS avgTeleCargoBall,  " +
        "   AVG(s.teleop_rocket_ball_count) AS avgTeleRocketBall  " +
        "   FROM scouting_form s  " +
        "   LEFT JOIN team t ON t.team_number = s.team_number  " +
        "   WHERE s.team_number = :teamNumber  " +
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
                @ColumnResult(name = "avgSandstormDisks", type = Double.class),
                @ColumnResult(name = "avgDisk", type = Double.class),
                @ColumnResult(name = "avgSandstormBalls", type = Double.class),
                @ColumnResult(name = "avgBall", type = Double.class),
                @ColumnResult(name = "avgClimbLevel", type = Double.class),
                @ColumnResult(name = "climbLevelMode", type = Integer.class),
                @ColumnResult(name = "droppedGamePieces", type = Integer.class),
                @ColumnResult(name = "avgDefensePlays", type = Double.class),
                @ColumnResult(name = "totalBalls", type = Integer.class),
                @ColumnResult(name = "totalDisks", type = Integer.class),
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