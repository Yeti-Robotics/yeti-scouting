# Yeti Scouting

## Setup
- Install Java JDK
- Install VSCode with the Java Extensions
- Install NodeJs
- Install the Postman App

## Running Locally
### API
Run the Gradle `bootRun` task
- Mac:  `./gradlew bootRun`
- Windows: `.\gradlew.bat bootRun`

#### Local database
To view the database visit: 
http://localhost:8080/h2
- username: scouting
- password: scouting
```
SELECT s.team_number AS "Team",
 t.team_name AS "Team Name", 
AVG(CAST (s.sandstorm_cargo_hatch_panel_count AS DOUBLE) + CAST (s.sandstorm_rocket_hatch_panel_count AS DOUBLE)) AS "Avg Disk",
AVG(CAST (s.sandstorm_cargo_ball_count AS DOUBLE) + CAST (s.sandstorm_rocket_ball_count AS DOUBLE)) AS "Avg Ball", 
COUNT(s.team_number) AS "Matches",
SUM(S.DROPPED_GAME_PIECES) AS "Total Dropped Game Pieces",
MAX(s.HAB_LEVEL_CLIMB) AS "Max Level Climbed",
AVG(CAST(s.DEFENSE AS DOUBLE)) AS "Avg Defense Plays"
FROM SCOUTING_FORM s
LEFT JOIN team t ON t.team_number = s.team_number
GROUP BY s.team_number
ORDER BY "Matches" DESC
```