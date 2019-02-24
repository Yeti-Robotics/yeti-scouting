package com.yetirobotics.yetiscouting.pit;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * PitController
 */
@RestController
@RequestMapping("/pitForms")
public class PitController {

    private PitPictureRepository pitPictureRepository;
    private PitCommentRepository pitCommentRepository;

    @Autowired
    public PitController(PitPictureRepository pitPictureRepository, PitCommentRepository pitCommentRepository) {
        this.pitPictureRepository = pitPictureRepository;
        this.pitCommentRepository = pitCommentRepository;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity submitPitForm(@RequestParam(name = "file", required = false) MultipartFile file,
            @RequestParam(name = "comment", required = false) String comment,
            @RequestParam("teamNumber") Integer teamNumber) throws Exception {
        if (file != null) {
            int i = file.getOriginalFilename().lastIndexOf('.');
            String extension = "";
            if (i>=0) {
                extension = file.getOriginalFilename().substring(i);
            }
            String fileName = "pics/" + UUID.randomUUID() + extension;
            Path path = Paths.get(fileName).toAbsolutePath().normalize();
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            PitPicture pitPicture = new PitPicture();
            pitPicture.setTeamNumber(teamNumber);
            pitPicture.setPicture(fileName);
            pitPictureRepository.save(pitPicture);
        }
        if (comment != null) {
            PitComment pitComment = new PitComment();
            pitComment.setComment(comment);
            pitComment.setTeamNumber(teamNumber);
            pitCommentRepository.save(pitComment);
        }
        return ResponseEntity.ok().build();
    }
}