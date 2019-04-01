package com.yetirobotics.yetiscouting.form;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * ScoutingFormRepository
 */
public interface ScoutingFormRepository extends PagingAndSortingRepository<ScoutingForm, Long> {
   ScoutingForm findByTeamNumberAndMatchNumber(int teamNumber, int matchNumber);
   List<ScoutingForm> findByTeamNumber(int teamNumber);
}