package com.yetirobotics.yetiscouting.team;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * TeamRepository
 */
public interface TeamRepository extends PagingAndSortingRepository<Team, Integer> {

    List<TeamList> teamList();
}