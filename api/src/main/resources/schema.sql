CREATE TABLE IF NOT EXISTS authorities(
    authority VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS pit_comment(
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    comment VARCHAR(2000) NOT NULL,
    scouter VARCHAR(255) NOT NULL,
    team_number INTEGER NOT NULL,
    timestamp TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS pit_picture(
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    picture VARCHAR(2000) NOT NULL,
    scouter VARCHAR(255) NOT NULL,
    team_number INTEGER NOT NULL,
    timestamp TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS team(
   team_number INTEGER NOT NULL PRIMARY KEY,
   team_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS scouting_form(
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    buddy_climb BOOLEAN,
    comment VARCHAR(255) NOT NULL,
    cross_habitat_line BOOLEAN NOT NULL,
    defense BOOLEAN,
    dropped_game_pieces INTEGER,
    got_lifted BOOLEAN,
    hab_level_climb INTEGER NOT NULL,
    hab_level_start INTEGER NOT NULL,
    lifted BOOLEAN,
    match_number INTEGER NOT NULL,
    preload INTEGER,
    rocket_level INTEGER,
    sandstorm_cargo_ball_count INTEGER NOT NULL,
    sandstorm_cargo_hatch_panel_count INTEGER NOT NULL,
    sandstorm_rocket_ball_count INTEGER NOT NULL,
    sandstorm_rocket_hatch_panel_count INTEGER NOT NULL,
    score INTEGER NOT NULL,
    scouter VARCHAR(255) NOT NULL,
    team_number INTEGER NOT NULL,
    teleop_cargo_ball_count INTEGER NOT NULL,
    teleop_cargo_hatch_panel_count INTEGER NOT NULL,
    teleop_rocket_ball_count INTEGER NOT NULL,
    teleop_rocket_hatch_panel_count INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS users(
    username VARCHAR(50) NOT NULL PRIMARY KEY,
    enabled BOOLEAN NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    password VARCHAR(500) NOT NULL,
    team_number INTEGER NOT NULL
);

INSERT INTO authorities(authority, username) VALUES
('role_admin', 'admin'),
('role_user', 'admin'),
('role_user', 'user');