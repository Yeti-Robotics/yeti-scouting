package com.yetirobotics.yetiscouting.tba;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yetirobotics.yetiscouting.form.ScoutingFormRepository;
import com.yetirobotics.yetiscouting.preference.Preference;
import com.yetirobotics.yetiscouting.preference.PreferenceRepository;
import com.yetirobotics.yetiscouting.tba.match.Match;

import com.yetirobotics.yetiscouting.team.Team;
import com.yetirobotics.yetiscouting.team.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.PathVariable;
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
    private TeamRepository teamRepository;
    private PreferenceRepository preferenceRepository;
    private List<Match> schedule = new ArrayList<>();

    @Autowired
    public BlueAllianceController(ScoutingFormRepository scoutingFormRepository, TeamRepository teamRepository, PreferenceRepository preferenceRepository) {
        this.scoutingFormRepository = scoutingFormRepository;
        this.teamRepository = teamRepository;
        this.preferenceRepository = preferenceRepository;
    }

    @RequestMapping(value = "/getFutureMatches", method = RequestMethod.GET)
    public ResponseEntity getFutureMatches() {
        int lastMatch = scoutingFormRepository.findTopByOrderByMatchNumberDesc().getMatchNumber();

        List<Match> matches, futureMatches;
        if (schedule.isEmpty()) {
            updateMatchSchedule();
        }
        matches = schedule;

        futureMatches = new ArrayList<>();
        for (Match match : matches) {
            if (match.isQual() && match.getMatchNumber() > lastMatch) {
                futureMatches.add(match);
            }
        }

        futureMatches.sort(Comparator.comparing(Match::getMatchNumber));

        return ResponseEntity.ok(futureMatches);
    }

    @RequestMapping(value = "/updateSchedule", method = RequestMethod.POST)
    public ResponseEntity<String> updateMatchSchedule() {
        try {
            String eventKey = preferenceRepository.findById(Preference.EVENT_KEY).orElseThrow(Exception::new).getPreferenceValue();
            ResponseEntity<String> result = tbaRequest("event/" + eventKey + "/matches");

            schedule = new ObjectMapper().readValue(updateMatchSchedule().getBody(), new TypeReference<List<Match>>() {});
            return ResponseEntity.ok(result.getBody());
        } catch (Exception e) {
            e.printStackTrace();
            preferenceRepository.updatePreference(Preference.TEAM_VALIDATION, "false");
            return ResponseEntity.status(500).build();
        }
    }

    @RequestMapping(value = "/resetTeam/{teamNumber}", method = RequestMethod.PATCH)
    public ResponseEntity resetTeam(@PathVariable int teamNumber) throws IOException {
        ResponseEntity<String> result = tbaRequest("team/frc" + teamNumber + "/simple");

        JsonNode teamNode = new ObjectMapper().readTree(result.getBody());
        String teamName = teamNode.get("nickname").asText();
        Team updatedTeam = teamRepository.findById(teamNumber).orElseGet(() -> {
            Team newTeam = new Team();
            newTeam.setNumber(teamNumber);
            return newTeam;
        });
        updatedTeam.setName(teamName);
        teamRepository.save(updatedTeam);

        return ResponseEntity.ok().build();
    }

    private ResponseEntity<String> tbaRequest(String uri) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-TBA-Auth-Key", "ChjNxHnTP0XQSHsn7xqjc7iTmWHqInOmxNwGfXaWFTA2c3vptfQUQYAORb5dpsNY");
        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);
        return new RestTemplate().exchange(
            "https://www.thebluealliance.com/api/v3/" + uri, HttpMethod.GET, entity, String.class);
    }

}
