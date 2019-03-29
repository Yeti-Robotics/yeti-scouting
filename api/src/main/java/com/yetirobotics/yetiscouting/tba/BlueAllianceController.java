package com.yetirobotics.yetiscouting.tba;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yetirobotics.yetiscouting.form.ScoutingFormRepository;
import com.yetirobotics.yetiscouting.tba.match.Match;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * TeamController
 */
@RestController
@RequestMapping("/tba")
public class BlueAllianceController {
    private ScoutingFormRepository scoutingFormRepository;
    private List<Match> schedule = new ArrayList<>();

    @Autowired
    public BlueAllianceController(ScoutingFormRepository scoutingFormRepository) {
        this.scoutingFormRepository = scoutingFormRepository;
    }

    @RequestMapping(value = "/getFutureMatches", method = RequestMethod.GET)
    public ResponseEntity getFutureMatches() {
        int lastMatch = scoutingFormRepository.findTopByOrderByMatchNumberDesc().getMatchNumber();

        List<Match> matches, futureMatches;
        try {
            matches = !schedule.isEmpty() ? schedule : new ObjectMapper().readValue(updateMatchSchedule().getBody(), new TypeReference<List<Match>>() {});
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }

        futureMatches = new ArrayList<>();
        for (Match match : matches) {
            if (match.isQual() && match.getMatchNumber() > lastMatch) {
                futureMatches.add(match);
            }
        }

        futureMatches.sort(Comparator.comparing(Match::getMatchNumber));

        return ResponseEntity.ok(futureMatches);
    }

    @RequestMapping(value = "/updateSchedule", method = RequestMethod.GET)
    public ResponseEntity<String> updateMatchSchedule() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-TBA-Auth-Key", "ChjNxHnTP0XQSHsn7xqjc7iTmWHqInOmxNwGfXaWFTA2c3vptfQUQYAORb5dpsNY");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
        ResponseEntity<String> result = new RestTemplate().exchange(
            "https://www.thebluealliance.com/api/v3/event/2019ncgui/matches", HttpMethod.GET, entity, String.class);

        return ResponseEntity.ok(result.getBody());
    }

}
