package com.yetirobotics.yetiscouting.pit;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * PitCommentRepository
 */
public interface PitCommentRepository extends PagingAndSortingRepository<PitComment, Long> {

    List<PitComment> findByTeamNumber(int teamNumber);
}