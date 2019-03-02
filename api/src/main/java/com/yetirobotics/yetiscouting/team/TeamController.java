package com.yetirobotics.yetiscouting.team;

import com.yetirobotics.yetiscouting.form.ScoutingFormRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * TeamController
 */
@RestController
public class TeamController {
    private ScoutingFormRepository scoutingFormRepository;

    @Autowired
    public TeamController(ScoutingFormRepository scoutingFormRepository) {
        this.scoutingFormRepository = scoutingFormRepository;
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/team/{teamNumber}")
    public ResponseEntity getTeam(@PathVariable("teamNumber") int teamNumber) {
        return ResponseEntity.ok().body(teamNumber);
    }

}