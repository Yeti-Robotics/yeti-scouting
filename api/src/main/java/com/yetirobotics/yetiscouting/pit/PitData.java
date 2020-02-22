package com.yetirobotics.yetiscouting.pit;

import java.util.Date;

import javax.persistence.*;

import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Data;

/**
 * PitComment
 */
@Entity
@Table(name = "pit_comment")
@EntityListeners(AuditingEntityListener.class)
@Data
@NamedNativeQuery(
    name = "PitComment.pitCommentsInfo",
    query = "SELECT `comment`, users.first_name AS scouterFirstName, users.last_name AS scouterLastName, `timestamp`, users.team_number AS scouterTeamNumber\n" +
        "FROM `pit_comment`\n" +
        "LEFT JOIN users ON users.username = scouter\n" +
        "WHERE pit_comment.team_number = :teamNumber",
    resultClass = PitCommentInfo.class,
    resultSetMapping = "pitCommentsInfo"
)
@SqlResultSetMapping(
    name = "pitCommentsInfo",
    classes = {
        @ConstructorResult(targetClass = PitCommentInfo.class,
            columns = {
                @ColumnResult(name = "comment", type = String.class),
                @ColumnResult(name = "scouterFirstName", type = String.class),
                @ColumnResult(name = "scouterLastName", type = String.class),
                @ColumnResult(name = "timestamp", type = String.class),
                @ColumnResult(name = "scouterTeamNumber", type = Integer.class),
            })
    }
)
public class PitData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "team_number", nullable = false)
    private Integer teamNumber;
    
    @Column(name = "comment", nullable = false, length = 2000)
    private String comment;

    @CreatedBy
    @Column(name = "scouter", nullable = false)
    private String scouter;

    @Column(name = "height", nullable = false)
    private Integer height;

    @Column(name = "shooting", nullable = false)
    private Integer shooting;

    @Column(name = "climbing", nullable = false)
    private Integer climbing;

    @Column(name = "rotation_control", nullable = false)
    private Boolean rotationControl;

    @Column(name = "position_control", nullable = false)
    private Boolean positionControl;

    @Column(name = "timestamp", nullable = false)
    @LastModifiedDate
    private Date timestamp;

}