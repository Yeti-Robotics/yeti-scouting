package com.yetirobotics.yetiscouting.tba;

import com.yetirobotics.yetiscouting.tba.match.Match;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * TeamController
 */
@RestController
@RequestMapping("/tba")
public class BlueAllianceController {
    private BlueAllianceService blueAllianceService;

    @Autowired
    public BlueAllianceController(BlueAllianceService blueAllianceService) {
        this.blueAllianceService = blueAllianceService;
    }

    @RequestMapping(value = "/getFutureMatches", method = RequestMethod.GET)
    public ResponseEntity getFutureMatches() {
        return ResponseEntity.ok(blueAllianceService.getFutureMatches());
    }

    @RequestMapping(value = "/updateSchedule", method = RequestMethod.POST)
    public ResponseEntity<List<Match>> updateMatchSchedule() {
        List<Match> schedule = blueAllianceService.updateMatchSchedule();

        if (schedule.isEmpty()) {
            return ResponseEntity.status(500).build();
        } else {
            return ResponseEntity.ok(schedule);
        }
    }

    @RequestMapping(value = "/resetTeam/{teamNumber}", method = RequestMethod.PATCH)
    public ResponseEntity resetTeam(@PathVariable int teamNumber) {
        if (blueAllianceService.resetTeam(teamNumber)) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(500).build();
        }
    }
}
