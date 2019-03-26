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
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
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

    @Autowired
    public BlueAllianceController(ScoutingFormRepository scoutingFormRepository) {
        this.scoutingFormRepository = scoutingFormRepository;
    }

    @RequestMapping(value = "/getFutureMatches", method = RequestMethod.GET)
    public ResponseEntity getFutureMatches() {
        int lastMatch = scoutingFormRepository.findTopByOrderByMatchNumberDesc().getMatchNumber();

        HttpHeaders headers = new HttpHeaders();
        headers.add("X-TBA-Auth-Key", "");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> result = restTemplate.exchange(
                "https://www.thebluealliance.com/api/v3/event/2019ncgui/matches", HttpMethod.GET, entity, String.class);

        List<Match> matches, futureMatches;
        try {
            matches = new ObjectMapper().readValue(result.getBody(), new TypeReference<List<Match>>() {});
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

        return ResponseEntity.ok().body(futureMatches);
    }

}
