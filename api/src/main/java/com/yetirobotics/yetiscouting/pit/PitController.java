package com.yetirobotics.yetiscouting.pit;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.yetirobotics.yetiscouting.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * PitController
 */
@RestController
@RequestMapping("/pit")
public class PitController {

    private PitPictureRepository pitPictureRepository;
    private PitCommentRepository pitCommentRepository;
    private UserRepository userRepository;

    @Autowired
    public PitController(PitPictureRepository pitPictureRepository, PitCommentRepository pitCommentRepository, UserRepository userRepository) {
        this.pitPictureRepository = pitPictureRepository;
        this.pitCommentRepository = pitCommentRepository;
        this.userRepository = userRepository;
    }

    @RequestMapping(value = "/{teamNumber}", method = RequestMethod.GET)
    public ResponseEntity getPit(@PathVariable int teamNumber) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode rootNode = mapper.createObjectNode();
        ArrayNode commentsArrayNode = mapper.createArrayNode();
        String commentsJson;

        List<PitComment> comments = pitCommentRepository.findByTeamNumber(teamNumber);
        for (PitComment comment : comments) {
            ObjectNode commentNode = mapper.createObjectNode();
            commentNode.put("comment", comment.getComment());
            commentNode.put("scouterFirstName", userRepository.findById(comment.getScouter()).get().getFirstName());
            commentNode.put("scouterLastName", userRepository.findById(comment.getScouter()).get().getLastName());
            commentNode.put("scouterTeamNumber", userRepository.findById(comment.getScouter()).get().getTeamNumber());
            commentsArrayNode.add(commentNode);
        }

//        try {
//            commentsJson = mapper.writeValueAsString(pitCommentRepository.findByTeamNumber(teamNumber));
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//            return ResponseEntity.status(500).build();
//        }
//
//        rootNode.put("comments", commentsJson);
        rootNode.set("comments", commentsArrayNode);

        ArrayNode picturesArrayNode = mapper.createArrayNode();
        List<PitPicture> pictures = pitPictureRepository.findByTeamNumberOrderByTimestampAsc(teamNumber);
        for (PitPicture picture : pictures) {
            ObjectNode pictureNode = mapper.createObjectNode();
            pictureNode.put("id", pictures.indexOf(picture));
            pictureNode.put("scouterFirstName", userRepository.findById(picture.getScouter()).get().getFirstName());
            pictureNode.put("scouterLastName", userRepository.findById(picture.getScouter()).get().getLastName());
            pictureNode.put("scouterTeamNumber", userRepository.findById(picture.getScouter()).get().getTeamNumber());
            picturesArrayNode.add(pictureNode);
        }

        rootNode.set("pictures", picturesArrayNode);

        try {
            return ResponseEntity.ok(mapper.writeValueAsString(rootNode));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }

    @RequestMapping(value = "/{teamNumber}/picture/{picId}", method = RequestMethod.GET)
    public ResponseEntity getPitPicture(@PathVariable int teamNumber, @PathVariable int picId) {
        PitPicture picture;
        try {
            picture = pitPictureRepository.findByTeamNumberOrderByTimestampAsc(teamNumber).get(picId);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
        try {
            byte[] pictureSrc = Files.readAllBytes(Paths.get(picture.getPicture()));
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(pictureSrc);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }



    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity submitPitForm(@RequestParam(name = "files[]", required = false) MultipartFile[] files,
            @RequestParam(name = "comment", required = false) String comment,
            @RequestParam("teamNumber") Integer teamNumber) throws Exception {
        if (files != null) {
            for (MultipartFile file : files){
                int i = file.getOriginalFilename().lastIndexOf('.');
                String extension = "";
                if (i >= 0) {
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