package com.yetirobotics.yetiscouting.user;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 */
@RestController
@RequestMapping("/users")
public class UserController {

    private final UserDetailsManager userDetailsManager;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserController(UserDetailsManager userDetailsManager,
                          PasswordEncoder passwordEncoder) {
        this.userDetailsManager = userDetailsManager;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping(method = RequestMethod.GET)
    public Principal getUser(@AuthenticationPrincipal Principal principal) {
        return principal;
    }

    @RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @Transactional
    public ResponseEntity createUser(@RequestBody @Valid User user) {
        if (userDetailsManager.userExists(user.getUsername())) {
            throw new UserNameExistException(user.getUsername());
        }
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(
                user.getUsername(),
                passwordEncoder.encode(user.getPassword()),
                AuthorityUtils.createAuthorityList("ROLE_USER"));
        userDetailsManager.createUser(userDetails);

        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @ResponseStatus(HttpStatus.CONFLICT)
    private static class UserNameExistException extends RuntimeException {
        public UserNameExistException(String username) {
            super(String.format("The username %s is already taken", username));
        }
    }
}
