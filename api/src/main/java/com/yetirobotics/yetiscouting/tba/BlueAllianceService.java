package com.yetirobotics.yetiscouting.tba;

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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class BlueAllianceService {

    private ScoutingFormRepository scoutingFormRepository;
    private TeamRepository teamRepository;
    private PreferenceRepository preferenceRepository;
    private List<Match> schedule = new ArrayList<>();
    @Value("${yeti.tba-api:fakeKey}")
    String apiKey;

    @Autowired
    public BlueAllianceService(ScoutingFormRepository scoutingFormRepository, TeamRepository teamRepository, PreferenceRepository preferenceRepository) {
        this.scoutingFormRepository = scoutingFormRepository;
        this.teamRepository = teamRepository;
        this.preferenceRepository = preferenceRepository;
    }

    public List<Match> getFutureMatches() {
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

        return futureMatches;
    }

    public List<Match> updateMatchSchedule() {
        try {
            String eventKey = preferenceRepository.findById(Preference.EVENT_KEY).orElseThrow(Exception::new).getPreferenceValue();
            ResponseEntity<String> result = tbaRequest("event/" + eventKey + "/matches");
            if (result.getStatusCodeValue() != 200) {
                return new ArrayList<>();
            }

            schedule = new ObjectMapper().readValue(result.getBody(), new TypeReference<List<Match>>() {});
            return schedule;
        } catch (Exception e) {
            preferenceRepository.updatePreference(Preference.TEAM_VALIDATION, "false");
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public boolean resetTeam(int teamNumber) {
        ResponseEntity<String> result = tbaRequest("team/frc" + teamNumber + "/simple");

        JsonNode teamNode;
        try {
            teamNode = new ObjectMapper().readTree(result.getBody());
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        String teamName = teamNode.get("nickname").asText();
        Team updatedTeam = teamRepository.findById(teamNumber).orElseGet(() -> {
            Team newTeam = new Team();
            newTeam.setNumber(teamNumber);
            return newTeam;
        });
        updatedTeam.setName(teamName);
        teamRepository.save(updatedTeam);

        return true;
    }

    public void cacheTeamInfo(int teamNumber) {
        if (!teamRepository.findById(teamNumber).isPresent()) {
            resetTeam(teamNumber);
        }
    }

    private ResponseEntity<String> tbaRequest(String uri) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-TBA-Auth-Key", apiKey);
        HttpEntity<String> entity = new HttpEntity<>("parameters", headers);
        return new RestTemplate().exchange(
            "https://www.thebluealliance.com/api/v3/" + uri, HttpMethod.GET, entity, String.class);
    }
}
