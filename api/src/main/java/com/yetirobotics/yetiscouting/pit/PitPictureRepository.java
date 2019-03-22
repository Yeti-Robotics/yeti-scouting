package com.yetirobotics.yetiscouting.pit;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * PitPictureRepository
 */
public interface PitPictureRepository extends PagingAndSortingRepository<PitPicture, Long> {

    List<PitPicture> findByTeamNumber(int teamNumber);
    List<PitPicture> findByTeamNumberOrderByTimestampAsc(int teamNumber);
}