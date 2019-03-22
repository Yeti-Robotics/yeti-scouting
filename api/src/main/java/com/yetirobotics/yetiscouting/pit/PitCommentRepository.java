package com.yetirobotics.yetiscouting.pit;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * PitCommentRepository
 */
public interface PitCommentRepository extends PagingAndSortingRepository<PitComment, Long> {

    @Query(nativeQuery = true)
    List<PitComment> findByTeamNumber(int teamNumber);
    List<PitCommentInfo> pitCommentsInfo(int teamNumber);
}