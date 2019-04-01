package com.yetirobotics.yetiscouting.form;

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

    @Autowired
    public FormController(ScoutingFormRepository scoutingFormRepository) {
        this.scoutingFormRepository = scoutingFormRepository;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity submittingForm(@RequestBody List<ScoutingForm> forms) {
        for (ScoutingForm scoutingForm : forms) {
            if (scoutingFormRepository.findByTeamNumberAndMatchNumber(scoutingForm.getTeamNumber(), scoutingForm.getMatchNumber()) == null) {
                scoutingFormRepository.save(scoutingForm);
            }
        }
        return ResponseEntity.ok().build();
    }
}
