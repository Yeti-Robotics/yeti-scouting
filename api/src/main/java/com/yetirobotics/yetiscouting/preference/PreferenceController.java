package com.yetirobotics.yetiscouting.preference;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/preference")
public class PreferenceController {

    private PreferenceRepository preferenceRepository;

    @Autowired
    public PreferenceController(PreferenceRepository preferenceRepository) {
        this.preferenceRepository = preferenceRepository;
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity updatePreference(@RequestParam String name, @RequestParam String value) {
        preferenceRepository.updatePreference(name, value);
        return respondFormattedPrefs();
    }

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity getPreferences() {
        return respondFormattedPrefs();
    }

    private ResponseEntity respondFormattedPrefs() {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode prefsNode = mapper.createObjectNode();
        preferenceRepository.findAll().forEach(preference -> {
            prefsNode.put(preference.getPreferenceName(), preference.getPreferenceValue());
        });

        try {
            return ResponseEntity.ok(mapper.writeValueAsString(prefsNode));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }
}
