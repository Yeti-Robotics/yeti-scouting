package com.yetirobotics.yetiscouting.form;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * ScoutingFormRepository
 */
public interface ScoutingFormRepository extends PagingAndSortingRepository<ScoutingForm, Long> {
   Optional<ScoutingForm> findByTeamNumberAndMatchNumber(int teamNumber, int matchNumber);
   List<ScoutingForm> findByTeamNumber(int teamNumber);
   ScoutingForm findTopByOrderByMatchNumberDesc();
}