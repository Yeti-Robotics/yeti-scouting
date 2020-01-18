package com.yetirobotics.yetiscouting.form;

import com.yetirobotics.yetiscouting.tba.BlueAllianceService;
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
    private BlueAllianceService blueAllianceService;

    @Autowired
    public FormController(ScoutingFormRepository scoutingFormRepository, BlueAllianceService blueAllianceService) {
        this.scoutingFormRepository = scoutingFormRepository;
        this.blueAllianceService = blueAllianceService;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity submittingForm(@RequestBody List<ScoutingForm> forms) {
        for (ScoutingForm scoutingForm : forms) {
            blueAllianceService.cacheTeamInfo(scoutingForm.getTeamNumber());
            if (!scoutingFormRepository.findByTeamNumberAndMatchNumber(scoutingForm.getTeamNumber(), scoutingForm.getMatchNumber()).isPresent()) {
                scoutingFormRepository.save(scoutingForm);
            }
        }
        return ResponseEntity.ok(forms);
    }
}
