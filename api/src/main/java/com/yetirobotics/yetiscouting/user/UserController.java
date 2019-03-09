package com.yetirobotics.yetiscouting.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

/**
 *
 */
@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public Principal getUser(@AuthenticationPrincipal Principal principal) {
        return principal;
    }

    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @Transactional
    public ResponseEntity createUser(@RequestBody @Valid User user) {
        if (userService.userExists(user.getUsername())) {
            throw new UserNameExistException(user.getUsername());
        }
        userService.createUser(user);

        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @ResponseStatus(HttpStatus.CONFLICT)
    private static class UserNameExistException extends RuntimeException {
        public UserNameExistException(String username) {
            super(String.format("The username %s is already taken", username));
        }
    }
}
