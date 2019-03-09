package com.yetirobotics.yetiscouting.pit;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
public class PitComment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "team_number", nullable = false)
    private Integer teamNumber;
    
    @Column(name = "comment", nullable = false, length = 2000)
    private String comment;

    @Column(name = "timestamp", nullable = false)
    @LastModifiedDate
    private Date timestamp;

    @CreatedBy
    @Column(name = "scouter", nullable = false)
    private String scouter;
}