-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql.yetirobotics.org
-- Generation Time: Mar 25, 2019 at 09:14 PM
-- Server version: 5.7.25-log
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yetirobotics_org_scouting`
--

INSERT INTO users(username, enabled, first_name, last_name, password, team_number) VALUES ('admin', TRUE, 'Admin', 'McCoolpants', '$2a$10$9ALpT96a4IAOBZ1BVnorKupnhCE6GM5VF3WHhKxAv402PX5NX4Gw2', 3506);
INSERT INTO users(username, enabled, first_name, last_name, password, team_number) VALUES ('user', TRUE, 'User', 'Userson', '$2a$10$t9Ebz8953gdqmB464K0RJ.vVe1.ZHu5P6l.k3W8oLDVx0me47qEg2', 3506);

INSERT INTO authorities(authority, username) VALUES ('role_admin', 'admin');
INSERT INTO authorities(authority, username) VALUES ('role_user', 'admin');
INSERT INTO authorities(authority, username) VALUES ('role_user', 'user');



INSERT INTO preference(preference_name, preference_value) VALUES ('eventKey', '2019nccmp');
INSERT INTO preference(preference_name, preference_value) VALUES ('teamValidation', 'true');

--
-- Truncate table before insert `scouting_form`
--

TRUNCATE TABLE `scouting_form`;
--
-- Dumping data for table `scouting_form`
--

insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (1, 5, 5, 1, 2, 'nunc rhoncus dui vel sem sed', 1, 1, 4398, 1, 0, 0, 245, 'Malinda Akrigg', 1, 3506, 4, 3, 2, 1, '2019-06-24 14:07:46');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (2, 1, 3, 2, 3, 'suspendisse potenti cras in purus eu magna', 1, 1, 2577, 0, 0, 1, 21, 'Claiborn Kobpal', 1, 5803, 3, 4, 0, 5, '2019-06-02 09:35:15');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (3, 3, 4, 5, 4, 'etiam pretium iaculis justo in hac habitasse', 1, 1, 8765, 0, 1, 1, 443, 'Jessalyn Twentyman', 1, 6803, 5, 2, 0, 4, '2019-11-07 23:58:47');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (4, 2, 3, 2, 5, 'ac est lacinia nisi venenatis tristique fusce congue', 1, 1, 9078, 0, 2, 0, 148, 'Bill Fassam', 0, 4451, 1, 0, 0, 5, '2019-09-29 13:51:03');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (5, 5, 0, 1, 0, 'in quam fringilla rhoncus mauris enim', 1, 0, 6235, 0, 0, 0, 452, 'Raffarty Studders', 1, 4929, 0, 4, 2, 3, '2019-03-05 19:42:00');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (6, 2, 3, 0, 0, 'posuere cubilia curae donec pharetra', 1, 1, 7443, 1, 0, 1, 414, 'Cris Leith', 0, 858, 2, 1, 3, 3, '2019-09-24 23:48:38');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (7, 2, 1, 1, 2, 'metus aenean fermentum donec ut mauris eget massa tempor', 1, 1, 1067, 1, 0, 1, 220, 'Monro Butlin', 1, 5572, 3, 3, 3, 5, '2019-06-16 17:55:25');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (8, 1, 1, 1, 2, 'turpis enim blandit mi in porttitor pede justo', 0, 0, 7940, 0, 3, 0, 317, 'Gregor Carlett', 1, 3925, 2, 0, 0, 0, '2019-05-11 06:18:14');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (9, 5, 2, 0, 0, 'consequat morbi a ipsum', 0, 1, 2792, 1, 1, 1, 29, 'Felicity Fouracres', 1, 6016, 2, 3, 0, 4, '2019-03-27 22:34:26');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (10, 4, 2, 2, 2, 'mi integer ac neque duis', 0, 1, 4553, 1, 1, 0, 81, 'Damaris McCorrie', 1, 7157, 4, 0, 3, 4, '2019-10-21 11:55:42');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (11, 4, 1, 4, 1, 'proin interdum mauris', 0, 1, 8240, 0, 0, 0, 316, 'Hillard Solan', 1, 180, 0, 2, 1, 2, '2019-10-18 00:17:33');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (12, 0, 3, 4, 3, 'ut at dolor', 0, 0, 1732, 1, 1, 1, 64, 'Karissa Clogg', 0, 6888, 2, 3, 3, 1, '2019-06-20 02:07:02');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (13, 5, 5, 4, 4, 'sollicitudin ut suscipit a feugiat et eros vestibulum', 1, 1, 4385, 1, 1, 0, 405, 'Persis Mariolle', 1, 7890, 3, 4, 5, 0, '2019-05-27 02:04:18');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (14, 4, 3, 1, 1, 'donec diam neque vestibulum', 1, 1, 6480, 1, 1, 1, 489, 'Jedidiah McGregor', 1, 3489, 2, 5, 4, 5, '2019-09-25 20:48:41');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (15, 1, 0, 4, 0, 'libero nam dui proin leo', 1, 0, 7916, 0, 0, 0, 103, 'Tricia Dignam', 0, 4061, 1, 1, 3, 5, '2020-01-25 16:33:38');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (16, 4, 2, 1, 2, 'ridiculus mus etiam vel augue vestibulum', 0, 0, 7652, 0, 2, 0, 446, 'Rhys Lightoller', 0, 6025, 5, 5, 2, 3, '2020-01-29 14:47:48');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (17, 5, 0, 2, 4, 'semper est quam pharetra magna', 1, 0, 7797, 1, 3, 1, 251, 'Eolanda Frohock', 1, 321, 3, 3, 1, 4, '2019-10-08 19:09:58');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (18, 5, 1, 5, 4, 'nisl nunc rhoncus dui', 0, 0, 7909, 0, 2, 1, 68, 'Waylin Klossmann', 0, 2642, 4, 2, 1, 1, '2019-08-06 13:36:13');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (19, 2, 2, 0, 4, 'nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque', 0, 0, 1697, 0, 3, 0, 334, 'Guendolen Bonhan', 0, 2175, 4, 0, 4, 2, '2019-12-21 19:24:43');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (20, 4, 1, 2, 0, 'sit amet nulla', 0, 1, 3213, 0, 2, 1, 94, 'Laetitia Leetham', 0, 1389, 3, 4, 3, 2, '2019-09-17 04:39:08');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (21, 0, 2, 1, 3, 'suspendisse accumsan tortor quis turpis sed ante vivamus', 1, 1, 6222, 1, 3, 1, 390, 'Mikey Valentim', 1, 2283, 4, 5, 0, 4, '2019-05-11 13:16:19');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (22, 3, 3, 1, 4, 'rutrum ac lobortis vel dapibus at', 0, 0, 6787, 1, 2, 0, 450, 'Wallie Melvin', 1, 5607, 2, 4, 2, 2, '2020-01-29 10:32:36');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (23, 1, 1, 5, 3, 'pede posuere nonummy integer non velit donec', 0, 0, 7239, 0, 1, 0, 357, 'Irita Headland', 0, 5199, 2, 5, 2, 4, '2019-06-02 14:54:36');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (24, 5, 4, 5, 2, 'blandit ultrices enim lorem ipsum dolor sit amet consectetuer', 1, 0, 4383, 0, 3, 0, 234, 'Ichabod Ham', 1, 1828, 5, 4, 3, 4, '2019-03-30 03:35:49');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (25, 2, 4, 2, 1, 'sollicitudin vitae consectetuer eget rutrum at lorem', 1, 0, 3852, 1, 0, 1, 265, 'Schuyler Eisig', 0, 4762, 2, 1, 3, 2, '2019-04-01 21:08:00');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (26, 5, 0, 2, 2, 'maecenas tincidunt lacus at velit vivamus vel', 1, 0, 9843, 0, 2, 0, 112, 'Hadlee Duffree', 1, 1089, 5, 1, 1, 0, '2019-09-29 07:03:25');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (27, 0, 1, 1, 3, 'amet erat nulla tempus vivamus in felis eu sapien', 1, 0, 9427, 1, 1, 0, 85, 'Abby Anstice', 0, 3506, 5, 4, 2, 5, '2019-10-30 05:12:51');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (28, 2, 5, 3, 1, 'aliquam convallis nunc proin at turpis a pede', 1, 1, 3981, 0, 2, 0, 102, 'Everett Reay', 0, 9999, 4, 4, 2, 0, '2019-08-09 00:21:49');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (29, 3, 0, 1, 3, 'nibh quisque id justo sit amet sapien dignissim', 0, 1, 5067, 1, 3, 0, 174, 'Carmela Palke', 1, 3459, 1, 5, 2, 5, '2019-11-14 21:21:00');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (30, 1, 1, 4, 5, 'ante vivamus tortor duis mattis', 0, 1, 5111, 1, 0, 1, 176, 'Mile Rousell', 1, 7293, 0, 2, 5, 1, '2020-01-30 23:46:46');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (31, 0, 4, 2, 3, 'duis at velit', 1, 1, 4038, 0, 2, 0, 118, 'Sven Houson', 0, 3965, 4, 1, 3, 4, '2019-03-21 13:49:26');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (32, 3, 2, 1, 1, 'vel augue vestibulum', 1, 0, 6594, 0, 2, 0, 115, 'Twyla Cullrford', 0, 2096, 1, 2, 3, 4, '2019-05-07 06:07:29');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (33, 4, 5, 1, 2, 'aenean lectus pellentesque eget nunc donec quis', 0, 1, 5221, 1, 3, 1, 191, 'Babbette Gwyer', 1, 3339, 2, 4, 3, 3, '2019-08-09 21:44:58');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (34, 1, 5, 3, 2, 'vulputate nonummy maecenas tincidunt lacus at', 0, 1, 3541, 1, 0, 1, 165, 'Robinetta Barcroft', 1, 1089, 4, 5, 0, 1, '2019-07-05 16:29:40');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (35, 0, 3, 2, 0, 'luctus et ultrices posuere cubilia curae mauris viverra', 1, 1, 7355, 1, 0, 1, 233, 'Chevy Hanretty', 1, 3506, 4, 4, 1, 5, '2019-06-17 14:39:36');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (36, 1, 3, 4, 2, 'est lacinia nisi venenatis tristique', 1, 0, 3852, 1, 1, 0, 116, 'Kenyon Capper', 1, 2640, 5, 4, 5, 0, '2019-07-01 10:22:38');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (37, 0, 0, 1, 3, 'odio consequat varius integer ac leo', 0, 0, 9755, 0, 2, 1, 196, 'Hollyanne Monkeman', 0, 1885, 5, 1, 4, 0, '2019-07-27 02:59:26');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (38, 2, 4, 0, 1, 'felis eu sapien cursus vestibulum', 0, 0, 8712, 1, 1, 1, 95, 'Marcos Trevenu', 0, 3970, 1, 1, 3, 1, '2019-07-25 14:41:00');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (39, 5, 4, 3, 0, 'morbi porttitor lorem id ligula suspendisse ornare consequat lectus', 0, 1, 7395, 0, 2, 0, 417, 'Madelon Lidell', 0, 1102, 5, 1, 1, 1, '2019-11-11 02:53:21');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (40, 3, 0, 1, 5, 'vulputate elementum nullam varius nulla facilisi cras', 1, 0, 4520, 1, 2, 0, 264, 'Vite Bampford', 0, 339, 1, 2, 1, 3, '2019-07-31 14:26:45');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (41, 0, 1, 2, 4, 'amet consectetuer adipiscing', 1, 0, 3486, 0, 3, 0, 471, 'Darcey Archbell', 1, 3197, 0, 5, 3, 2, '2019-09-04 11:52:04');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (42, 0, 0, 4, 3, 'fusce lacus purus aliquet at feugiat non pretium quis lectus', 1, 1, 2782, 0, 3, 1, 61, 'Trace Ogborn', 0, 3656, 2, 3, 4, 5, '2019-07-20 19:27:41');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (43, 5, 4, 4, 0, 'semper interdum mauris ullamcorper purus sit amet nulla', 1, 0, 6021, 0, 3, 0, 132, 'Winna De Nisco', 1, 422, 3, 4, 3, 3, '2019-09-29 05:16:21');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (44, 0, 1, 0, 3, 'metus arcu adipiscing molestie hendrerit at vulputate vitae', 1, 0, 4685, 0, 2, 1, 287, 'Loreen Avrahamoff', 1, 4010, 3, 3, 5, 0, '2019-04-18 15:11:40');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (45, 5, 5, 0, 2, 'nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus', 0, 1, 9790, 1, 2, 1, 348, 'Washington Aleso', 0, 6366, 3, 0, 4, 0, '2019-05-03 18:47:24');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (46, 1, 1, 1, 3, 'in faucibus orci', 0, 1, 8751, 0, 0, 0, 401, 'Mona Blowne', 1, 254, 0, 4, 1, 4, '2019-05-02 04:26:27');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (47, 3, 2, 4, 2, 'a suscipit nulla elit ac', 0, 1, 9152, 0, 3, 1, 302, 'Ruthann Hartwright', 1, 2640, 0, 5, 0, 5, '2019-05-21 01:44:05');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (48, 1, 5, 3, 2, 'adipiscing molestie hendrerit at vulputate vitae nisl', 0, 1, 6561, 1, 2, 0, 242, 'Tani Housbie', 0, 1868, 2, 3, 0, 3, '2019-11-07 11:42:24');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (49, 0, 1, 4, 4, 'vitae ipsum aliquam non mauris morbi non', 1, 1, 8225, 1, 1, 0, 444, 'Kristine Cheater', 1, 6014, 1, 5, 5, 3, '2019-12-13 15:31:34');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (50, 4, 5, 4, 3, 'et commodo vulputate justo in blandit ultrices', 1, 1, 8138, 0, 1, 1, 32, 'Yevette Margach', 1, 3641, 1, 4, 1, 3, '2019-04-02 08:07:42');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (51, 1, 2, 5, 5, 'vestibulum sagittis sapien cum', 0, 0, 4359, 0, 2, 1, 173, 'Dulci Foyle', 0, 3197, 0, 4, 4, 5, '2019-07-31 00:22:50');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (52, 4, 2, 2, 1, 'interdum eu tincidunt', 1, 0, 4899, 0, 1, 1, 452, 'Nataline Connikie', 1, 6500, 3, 4, 3, 3, '2019-12-03 21:49:41');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (53, 0, 5, 1, 2, 'et magnis dis parturient', 0, 1, 1307, 0, 1, 1, 81, 'Rianon Rhucroft', 0, 3147, 4, 5, 3, 1, '2019-08-20 16:41:34');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (54, 1, 2, 0, 2, 'sapien sapien non mi integer', 1, 1, 6960, 0, 0, 1, 53, 'Clementina Dosdale', 0, 6502, 0, 1, 3, 5, '2019-05-29 06:49:31');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (55, 3, 0, 3, 0, 'adipiscing molestie hendrerit at vulputate vitae nisl aenean', 1, 1, 4375, 0, 0, 0, 233, 'Cobby Benitti', 1, 1902, 4, 5, 1, 4, '2019-02-20 22:39:07');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (56, 3, 0, 0, 0, 'id nisl venenatis lacinia', 1, 1, 1234, 0, 1, 1, 203, 'Wilmer Churchlow', 1, 5727, 0, 1, 2, 4, '2019-03-11 01:50:27');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (57, 5, 5, 3, 5, 'magna vulputate luctus cum sociis natoque penatibus et', 1, 0, 6355, 0, 2, 0, 408, 'Sutherland Bransden', 1, 2583, 2, 3, 0, 4, '2019-12-06 12:03:43');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (58, 5, 4, 5, 4, 'tortor duis mattis egestas metus aenean fermentum donec', 1, 1, 6639, 1, 3, 0, 230, 'Sharon Cuthbertson', 0, 7173, 1, 0, 2, 3, '2019-08-26 18:19:32');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (59, 3, 1, 5, 0, 'fermentum donec ut mauris', 1, 1, 2797, 1, 0, 0, 154, 'Alie Simenel', 1, 5839, 1, 2, 3, 2, '2019-12-02 00:47:03');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (60, 0, 2, 1, 4, 'nulla sed vel enim sit amet nunc', 0, 1, 4938, 0, 2, 0, 275, 'Coleman Mewes', 0, 4816, 0, 5, 4, 0, '2019-02-17 13:44:52');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (61, 3, 3, 4, 1, 'sapien sapien non', 1, 1, 7849, 1, 3, 1, 484, 'Agathe Dickson', 1, 3656, 5, 3, 4, 3, '2019-10-16 20:38:56');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (62, 2, 4, 2, 5, 'quam suspendisse potenti nullam', 0, 0, 9533, 0, 3, 1, 478, 'Mendel Braddock', 0, 3737, 5, 5, 5, 3, '2019-10-23 21:51:25');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (63, 0, 5, 2, 2, 'congue vivamus metus arcu adipiscing', 0, 0, 5536, 1, 3, 0, 438, 'Cammi Bickerdicke', 1, 4400, 4, 0, 3, 5, '2019-12-20 15:09:19');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (64, 4, 4, 4, 0, 'lectus pellentesque at nulla', 0, 1, 9786, 1, 3, 1, 27, 'Nina Sodor', 0, 3339, 2, 4, 0, 4, '2019-10-03 13:43:14');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (65, 1, 5, 3, 3, 'auctor gravida sem praesent id massa id nisl', 0, 0, 1551, 1, 0, 1, 166, 'Vaclav Dowker', 1, 3223, 4, 1, 0, 4, '2020-02-07 15:44:06');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (66, 3, 3, 1, 1, 'tristique in tempus sit amet', 0, 0, 7279, 0, 2, 0, 278, 'Elizabet Cansdale', 1, 3965, 3, 3, 3, 4, '2019-04-08 02:49:40');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (67, 3, 2, 0, 2, 'morbi non lectus aliquam', 0, 1, 1651, 0, 2, 1, 90, 'Reina Welds', 1, 3930, 1, 2, 0, 3, '2020-01-29 04:47:44');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (68, 4, 3, 5, 4, 'tincidunt eget tempus vel pede morbi', 1, 1, 9385, 1, 0, 0, 391, 'Andree Cornwell', 0, 7890, 4, 2, 3, 5, '2019-11-29 19:37:44');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (69, 4, 3, 3, 5, 'lobortis ligula sit amet', 1, 1, 7970, 0, 3, 1, 127, 'Jess Swinyard', 0, 5762, 2, 0, 0, 0, '2020-01-01 21:50:43');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (70, 0, 4, 5, 0, 'vel ipsum praesent blandit', 1, 0, 3864, 0, 2, 0, 393, 'Miof mela Normansell', 0, 1984, 5, 4, 3, 5, '2019-04-19 10:09:46');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (71, 4, 0, 2, 1, 'et magnis dis parturient montes nascetur', 0, 1, 3076, 1, 2, 1, 365, 'Giana MacLice', 0, 2682, 2, 0, 3, 1, '2020-01-21 18:10:49');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (72, 0, 2, 5, 3, 'a suscipit nulla elit ac nulla sed vel enim', 0, 1, 2929, 0, 1, 1, 406, 'Maurits Guitonneau', 1, 3763, 1, 1, 2, 2, '2019-10-06 19:25:50');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (73, 5, 2, 5, 1, 'ut odio cras mi pede', 1, 1, 7011, 1, 1, 0, 174, 'Scotty McLaggan', 0, 6060, 2, 3, 0, 2, '2019-10-12 12:32:24');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (74, 2, 5, 3, 5, 'sollicitudin ut suscipit a feugiat et', 0, 0, 9035, 1, 3, 1, 438, 'Neron Battams', 0, 4180, 1, 1, 5, 0, '2019-11-04 09:26:08');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (75, 0, 5, 2, 4, 'montes nascetur ridiculus mus etiam vel augue vestibulum', 0, 0, 1014, 0, 3, 0, 376, 'Prentice Worling', 1, 5727, 1, 1, 5, 3, '2019-03-28 20:40:54');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (76, 0, 0, 5, 5, 'praesent blandit nam', 1, 1, 3793, 1, 1, 0, 275, 'Riki Kermit', 1, 5414, 0, 2, 2, 3, '2020-02-07 16:28:18');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (77, 0, 1, 5, 2, 'justo etiam pretium', 0, 0, 4915, 0, 0, 0, 451, 'Katrina Alkins', 1, 5854, 1, 2, 2, 5, '2019-03-08 05:35:13');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (78, 4, 2, 1, 3, 'amet turpis elementum ligula', 0, 0, 4194, 0, 1, 1, 346, 'Jonathon Grass', 0, 25, 2, 0, 1, 0, '2020-01-16 18:18:53');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (79, 0, 5, 2, 3, 'nulla tellus in sagittis dui vel nisl duis ac nibh', 0, 1, 2293, 0, 2, 0, 354, 'Hedi Yanukhin', 1, 2992, 0, 0, 0, 5, '2019-09-25 11:30:42');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (80, 0, 0, 2, 0, 'eget congue eget semper rutrum nulla nunc', 0, 1, 3237, 0, 0, 1, 271, 'Thor Bartocci', 0, 456, 2, 4, 5, 0, '2019-12-22 17:17:27');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (81, 5, 0, 4, 4, 'proin eu mi nulla', 0, 0, 7621, 1, 0, 1, 163, 'Cyb Sealey', 1, 4935, 2, 1, 1, 5, '2019-02-13 22:18:24');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (82, 5, 4, 5, 3, 'sociis natoque penatibus et magnis dis parturient', 1, 0, 1641, 0, 3, 0, 19, 'Bryanty Lednor', 1, 2655, 2, 4, 3, 2, '2019-08-07 06:22:52');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (83, 5, 1, 1, 0, 'proin interdum mauris', 0, 1, 9871, 0, 3, 1, 327, 'Rudolfo O''Loughlin', 1, 456, 2, 3, 2, 4, '2019-12-09 13:16:24');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (84, 4, 0, 0, 0, 'nisi vulputate nonummy maecenas tincidunt lacus at velit', 1, 1, 3496, 0, 0, 1, 185, 'Marlee Addyman', 1, 2583, 3, 1, 5, 4, '2019-03-08 00:35:23');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (85, 4, 5, 5, 1, 'rutrum ac lobortis vel dapibus at diam', 1, 1, 2406, 0, 1, 0, 445, 'Kelila Jervoise', 1, 1261, 4, 5, 3, 3, '2019-03-26 01:46:40');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (86, 0, 4, 1, 2, 'eu est congue elementum in hac habitasse platea', 0, 0, 5153, 0, 0, 1, 397, 'Ervin Folshom', 0, 3970, 5, 1, 1, 1, '2019-02-12 02:48:26');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (87, 5, 0, 4, 3, 'nibh fusce lacus', 0, 0, 9843, 1, 1, 1, 281, 'Joice Jansik', 0, 4469, 3, 0, 5, 5, '2019-03-10 07:59:10');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (88, 1, 0, 5, 4, 'commodo vulputate justo in blandit ultrices enim', 0, 1, 6601, 0, 0, 1, 85, 'Sandro Pleuman', 0, 5572, 3, 5, 2, 1, '2020-01-09 04:19:37');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (89, 5, 5, 5, 0, 'volutpat erat quisque erat eros viverra eget', 1, 1, 2562, 1, 3, 0, 158, 'Jewel Polfer', 0, 3822, 5, 4, 4, 0, '2020-01-29 08:06:17');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (90, 4, 0, 0, 2, 'quam turpis adipiscing lorem vitae mattis', 1, 1, 5872, 1, 0, 1, 145, 'Arlinda Goodall', 1, 5199, 4, 0, 1, 4, '2019-04-22 09:16:25');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (91, 0, 5, 5, 2, 'nibh quisque id justo sit', 0, 1, 2129, 0, 0, 1, 36, 'Aldis Sporner', 0, 3970, 1, 1, 5, 3, '2019-02-28 13:04:53');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (92, 1, 0, 0, 1, 'odio justo sollicitudin ut suscipit a feugiat et eros', 1, 0, 9076, 1, 1, 1, 29, 'Wynn Wintersgill', 1, 5854, 0, 1, 5, 4, '2019-12-28 10:27:32');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (93, 2, 1, 2, 4, 'lectus pellentesque eget nunc', 0, 0, 9674, 1, 1, 1, 330, 'Sheryl Hacun', 1, 148, 1, 4, 3, 0, '2019-12-24 06:00:07');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (94, 0, 2, 2, 3, 'neque aenean auctor gravida sem', 0, 1, 2628, 1, 1, 1, 391, 'Alford Conry', 0, 2220, 0, 0, 0, 5, '2019-04-13 00:34:27');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (95, 4, 0, 2, 0, 'in lectus pellentesque at nulla', 0, 0, 1027, 0, 1, 1, 292, 'Nicoline Luckcuck', 0, 1389, 5, 2, 0, 3, '2019-12-17 04:53:05');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (96, 4, 0, 4, 2, 'habitasse platea dictumst etiam faucibus cursus', 0, 0, 4213, 0, 1, 1, 476, 'Blisse Layton', 0, 1868, 1, 0, 2, 5, '2019-06-01 10:22:28');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (97, 1, 0, 4, 1, 'nisl aenean lectus pellentesque eget nunc donec quis orci eget', 1, 0, 4741, 0, 1, 1, 112, 'Jonie Lackeye', 1, 5679, 2, 5, 4, 0, '2019-06-04 05:48:26');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (98, 3, 5, 3, 2, 'vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem', 1, 0, 6075, 1, 1, 1, 419, 'Verge Guyonneau', 0, 3230, 3, 3, 0, 0, '2019-05-04 23:45:06');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (99, 4, 0, 5, 0, 'dapibus duis at velit eu', 1, 1, 5306, 0, 1, 1, 182, 'Siffre Burkill', 1, 4910, 1, 5, 1, 1, '2019-11-04 19:16:38');
insert into scouting_form (id, auto_low_missed_balls, auto_low_scored_balls, auto_upper_missed_balls, auto_upper_scored_balls, comment, cross_initiation_line, end_position, match_number, position_control, preload, rotation_control, score, scouter, spill_balls, team_number, teleop_low_missed_balls, teleop_low_scored_balls, teleop_upper_missed_balls, teleop_upper_scored_balls, timestamp) values (100, 1, 3, 4, 5, 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor', 1, 1, 7836, 0, 3, 1, 136, 'Malorie Taber', 1, 9997, 2, 2, 1, 0, '2019-09-23 01:41:57');


--
-- Truncate table before insert `team`
--

TRUNCATE TABLE `team`;
--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_number`, `team_name`) VALUES(1, 'The Juggernauts');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(8, 'Team 8');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(25, 'Raider Robotix');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(59, 'RamTech');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(148, 'Robowranglers');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(166, 'Chop Shop');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(180, 'S.P.A.M.');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(191, 'X-CATS');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(238, 'Cruisin\' Crusaders');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(254, 'The Cheesy Poofs');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(281, 'The GreenVillains');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(283, 'The Generals');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(287, 'Floyd');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(294, 'Beach Cities Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(321, 'RoboLancers');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(339, 'Kilroy Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(342, 'Burning Magnetos');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(359, 'Hawaiian Kids');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(379, 'RoboCats');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(399, 'Eagle Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(422, 'Mech Tech Dragons');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(435, 'Robodogs');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(456, 'Siege Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(585, 'Cyber Penguins');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(587, 'Hedgehogs');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(639, 'Code Red Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(694, 'StuyPulse');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(836, 'The RoboBees');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(858, 'Demons');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(876, 'Thunder Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(900, 'The Zebracorns');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(955, 'CV Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(957, 'SWARM');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(973, 'Greybots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(980, 'ThunderBots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(987, 'HIGHROLLERS');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1073, 'The Force Team');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1089, 'Team Mercury');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1102, 'M\'Aiken Magic ');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1123, 'AIM Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1156, 'Under Control');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1225, 'Gorillas');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1261, 'Robo  Lions');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1389, 'The Body Electric');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1511, 'Rolling Thunder');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1533, 'Triple Strange');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1553, 'KC Robotics Team');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1600, 'ROBO KINGS AND QUEENS');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1662, 'Raptor Force Engineering');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1706, 'Ratchet Rockers');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1810, 'Jaguar Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1828, 'BoxerBots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1868, 'Space Cookies');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1885, 'ILITE Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1902, 'Exploding Bacon');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1983, 'Skunk Works Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1984, 'Jawas');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(1991, 'Dragons');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2059, 'The Hitchhikers');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2080, 'Torbotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2096, 'RoboActive');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2168, 'Aluminum Falcons');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2175, 'The Fighting Calculators');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2219, 'Megahurts');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2220, 'Blue Twilight');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2283, 'Panteras');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2557, 'SOTAbots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2583, 'RoboWarriors');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2640, 'HOTBOTZ');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2642, 'Pitt Pirates');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2655, 'The Flying Platypi');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2682, 'Boneyard Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2815, 'Blue Devil Mechanics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2848, 'The All Sparks');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2854, 'The Prototypes');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2883, 'F.R.E.D (Fighting Rednecks Engineering and Design)');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2974, 'Walton Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2976, 'Spartabots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2980, 'The Whidbey Island Wild Cats');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2990, 'Hotwire');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(2992, 'The S.S. Prometheus');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3005, 'RoboChargers');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3019, 'Firebirds');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3075, 'Ha-Dream Team');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3147, 'Munster HorsePower');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3196, 'Team SPORK');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3197, 'HexHounds');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3215, 'Apollo');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3223, 'Robotics Of Central Kitsap');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3229, 'Hawktimus Prime');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3230, 'PrototypeX');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3234, 'Red Arrows');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3284, 'Camdenton 4H LASER 3284');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3310, 'Black Hawk Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3336, 'Zimanators');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3339, 'BumbleB');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3374, 'RoboBroncs');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3397, 'Robolions');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3402, 'ROBOMonkeys');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3459, 'Team PyroTech');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3489, 'Category 5');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3490, 'Viper Drive');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3495, 'MindCraft Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3506, 'YETI Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3546, 'Buc\'n\'Gears');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3618, 'Petoskey Paladins');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3641, 'The Flying Toasters');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3656, 'Dreadbots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3661, 'RoboWolves');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3680, 'Elemental Dragons');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3711, 'Iron Mustang');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3737, 'Roto-Raptors');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3763, '4-H WildCards');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3770, 'BlitzCreek');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3822, 'Neon Jets');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3845, 'Yellow Jackets');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3925, 'Circuit of Life');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3930, 'SMART  Spruce Mountain Area Robotics Team');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3965, 'Sultans');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3970, 'Duncan Dynamics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3971, 'Kai Orbus');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(3990, 'Tech for Kids');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4010, 'Nautilus');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4061, 'SciBorgs');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4083, 'The Iron Wolverines');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4087, 'Falcon Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4180, 'Iron Riders');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4188, 'Columbus Space Program');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4290, 'Bots on Wheels');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4291, 'KerrBots (pronounced CarBots)');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4329, 'Lutheran Roboteers');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4335, 'Metallic Clouds');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4400, 'CERBOTICS');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4451, 'ROBOTZ Garage');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4455, 'The Burger Bots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4469, 'R.A.I.D. (Raider Artificial Intelligence DIvision)');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4534, 'Wired Wizards');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4561, 'TerrorBytes');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4646, 'Team ASAP');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4733, 'Scarlett Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4762, 'Robo-Saints');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4767, 'C4');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4775, 'Aztech Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4795, 'EastBots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4816, 'Gadget Girls');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4828, 'RoboEagles');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4829, 'Titanium Tigers');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4910, 'East Cobb Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4929, 'Maroon Monsoon');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(4935, 'T-Rex');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5160, 'Chargers');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5190, 'Green Hope Falcons');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5199, 'Robot Dolphins From Outer Space');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5242, 'âš™ï¸ RoboCats âš™ï¸');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5279, 'Bionic Eagles');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5291, 'Emperius');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5327, 'Griffin Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5406, 'Celt-X');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5414, 'Pearadox');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5446, 'Pink Detectives');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5496, 'Robo Knights');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5511, 'Cortechs Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5518, 'Techno Wolves');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5544, 'SWIFT Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5572, 'ROSBOTS');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5607, 'Team Firewall');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5679, 'Girls on Fire');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5724, 'Spartan Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5727, 'REaCH Omegabytes');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5762, 'Franklinbots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5801, 'CTC Inspire');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5803, 'Apex Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5809, 'The Jesubots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5834, 'R3P2');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5837, 'Unity4Tech');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5839, 'Blue Whales');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5854, 'GLITCH');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5892, 'High Energy');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5919, 'JoCo RoBos');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5933, 'JudgeMent Call');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5940, 'B.R.E.A.D.');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5976, 'CyberSaders');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(5979, 'Apex');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6003, 'S.U.M. (Singularly Unified Madness)');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6004, 'f(x) Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6014, 'ARC');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6016, 'Tiger Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6025, 'Adroit Androids');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6034, 'Eagle Storms');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6050, 'Wee Waa Bush Bots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6060, 'Circuit Serpents');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6214, 'Los Creadores');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6215, 'Armored Eagles');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6332, 'Bull City Botics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6353, 'Zodiac');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6366, 'RAM Rodz Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6426, 'Robo Gladiators');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6500, 'GearCats');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6502, 'DARC SIDE');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6565, 'Team Bobcat');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6639, 'Mechanical Minds');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6672, 'Fusion Corps');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6702, 'StingBots Santa Anita');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6705, 'WildCat 5e');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6729, 'RobCoBots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6803, 'HAI-Panda');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6885, 'The Pilots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6888, 'BC Breakouts');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6894, 'Iced Java');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6907, 'The G.O.A.T');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6908, 'Infuzed');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6919, 'The Commodores');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6932, 'S.M.A.R.T.');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7029, 'Scotbotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7034, '2B Determined');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7039, 'âŒâ­•');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7140, 'OKSEF ROBOTICS');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7157, ' Î¼Botics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7173, 'Iris Robotics');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7293, 'COTANAK ROBOTICS');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(9996, 'Off-Season Demo Team');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(9997, 'Off-Season Demo Team');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(9998, 'Off-Season Demo Team');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(9999, 'Off-Season Demo Team');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(6899, 'Macon Bots FRC');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7443, 'Overhills Jag-Wires');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7815, 'CavBots');
INSERT INTO `team` (`team_number`, `team_name`) VALUES(7890, 'SeQuEnCe');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
