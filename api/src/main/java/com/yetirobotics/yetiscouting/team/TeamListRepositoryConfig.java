package com.yetirobotics.yetiscouting.team;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;

/**
 * TeamListRepositoryConfig
 */
@Configuration
 public class TeamListRepositoryConfig implements RepositoryRestConfigurer{
@Override
public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
    config.exposeIdsFor(TeamList.class, Team.class);
    
}
    
}