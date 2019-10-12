package com.yetirobotics.yetiscouting.tba;

import com.fasterxml.jackson.databind.JsonNode;
import com.yetirobotics.yetiscouting.form.ScoutingFormRepository;
import com.yetirobotics.yetiscouting.preference.Preference;
import com.yetirobotics.yetiscouting.preference.PreferenceRepository;
import com.yetirobotics.yetiscouting.tba.match.Match;
import com.yetirobotics.yetiscouting.team.Team;
import com.yetirobotics.yetiscouting.team.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class BlueAllianceService {

    private ScoutingFormRepository scoutingFormRepository;
    private TeamRepository teamRepository;
    private PreferenceRepository preferenceRepository;
    private List<Match> schedule = new ArrayList<>();
    private final RestTemplate restTemplate;

    @Autowired
    public BlueAllianceService(ScoutingFormRepository scoutingFormRepository, TeamRepository teamRepository,
                               PreferenceRepository preferenceRepository,
                               RestTemplateBuilder restTemplateBuilder,
                               @Value("${yeti.tba-api-url:fakePath}") String apiUrl,
                               @Value("${yeti.tba-api:fakeKey}") String apiKey) {
        this.scoutingFormRepository = scoutingFormRepository;
        this.teamRepository = teamRepository;
        this.preferenceRepository = preferenceRepository;
        this.restTemplate = restTemplateBuilder.rootUri(apiUrl)
                .additionalInterceptors((request, body, execution) -> {
                    request.getHeaders().add("X-TBA-Auth-Key", apiKey);
                    return execution.execute(request, body);
                })
                .build();
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
            schedule = restTemplate.exchange("/event/" + eventKey + "/matches",
                    HttpMethod.GET,
                    null,
                    new ParameterizedTypeReference<List<Match>>() {
                    }).getBody();

            return schedule;
        } catch (Exception e) {
            preferenceRepository.updatePreference(Preference.TEAM_VALIDATION, "false");
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public boolean resetTeam(int teamNumber) {
        JsonNode teamNode;
        try {
            teamNode = restTemplate.getForObject("/team/frc" + teamNumber + "/simple", JsonNode.class);
        } catch (Exception e) {
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
}
