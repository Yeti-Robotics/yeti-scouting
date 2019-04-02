package com.yetirobotics.yetiscouting.form;

import com.yetirobotics.yetiscouting.tba.BlueAllianceController;
import com.yetirobotics.yetiscouting.team.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/scoutingForm")
public class FormController {
    private ScoutingFormRepository scoutingFormRepository;
    private TeamRepository teamRepository;
    @Autowired
    private BlueAllianceController blueAllianceController;

    @Autowired
    public FormController(ScoutingFormRepository scoutingFormRepository, TeamRepository teamRepository) {
        this.scoutingFormRepository = scoutingFormRepository;
        this.teamRepository = teamRepository;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity submittingForm(@RequestBody List<ScoutingForm> forms) {
        for (ScoutingForm scoutingForm : forms) {
            if (scoutingFormRepository.findByTeamNumberAndMatchNumber(scoutingForm.getTeamNumber(), scoutingForm.getMatchNumber()) == null) {
                if (!teamRepository.findById(scoutingForm.getTeamNumber()).isPresent()) {
                    blueAllianceController.resetTeam(scoutingForm.getTeamNumber());
                }
                scoutingFormRepository.save(scoutingForm);
            }
        }
        return ResponseEntity.ok(forms);
    }
}
