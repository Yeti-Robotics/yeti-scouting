package com.yetirobotics.yetiscouting.pit;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Data;

/**
 * PitPicture
 */
@Entity
@Table(name = "pit_picture")
@EntityListeners(AuditingEntityListener.class)
@Data
public class PitPicture {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "team_number", nullable = false)
    private Integer teamNumber;
    
    @Column(name = "picture", nullable = false, length = 2000)
    private String picture;

    @Column(name = "timestamp", nullable = false)
    @LastModifiedDate
    private Date timestamp;
}