package com.yetirobotics.yetiscouting.user;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonProperty;

import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

/**
 *
 */
@Entity
@Data
@Table(name = "users")
public class User implements UserDetails, CredentialsContainer {

    @Id
    @Column(name = "username", nullable = false, length = 50)
    @NotNull
    @Size(min = 4, max = 50)
    private String username;

    @Column(name = "password", nullable = false, length = 500)
    @NotNull
    @Size(min = 4, max = 500)
    private String password;

    @Column(name = "first_name", nullable = false, length = 100)
    @NotNull
    @Size(min = 2, max = 100)
    private String firstName;

    @Column(name = "last_name", nullable = false, length = 100)
    @NotNull
    @Size(min = 2, max = 100)
    private String lastName;

    @Column(name = "enabled", nullable = false)
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private Boolean enabled = Boolean.TRUE;

    @Column(name = "team_number", nullable = false)
    private Integer teamNumber;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private Collection<Authority> authorities;

    @Override
    public boolean isAccountNonExpired() {
        return enabled;
    }

    @Override
    public boolean isAccountNonLocked() {
        return enabled;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return enabled;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    @Override
    public void eraseCredentials() {
        password = null;
    }
}
