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
    query = "SELECT s.team_number as teamNumber, t.team_name as teamName, count(*) as count " +
    "FROM scouting_form s " +
    "LEFT JOIN team t ON t.team_number = s.team_number " +
    "GROUP BY s.team_number " +
    "ORDER BY count DESC",
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
            @ColumnResult(name = "count", type = Integer.class),
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