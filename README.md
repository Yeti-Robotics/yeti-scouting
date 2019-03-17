# Yeti Scouting

## Stuff to Add
- [ ] Submit timeout stores form data to be submitted later or generate json to give to admin
- [ ] Just remove the score field, there's no hope
- [ ] Ability to add matches to list in case of replays
- [x] Add option for user to type in team and match number if internet is slow
- [ ] Fix match list
- [ ] Match page: add a not scouted check
- [ ] Admin: scout as
- [ ] Give bytecoins for scouting
- [x] Remove online dependency of highchart
- [x] list: Avg tele switch; replace total teleop
- [ ] Fix placement of score on match page when a team wasn't scouted:  alliance colspan=teams.length
- [x] Clarify vault field
- [x] list: Avg tele scale
- [ ] Add a check for the invalid match label
- [x] Make iced Java team
- [x] list: Avg tele vault
- [x] Limit score to positive numbers
- [ ] Add a loading spinner
- [x] Deploy
- [ ] Disable keyboard input on switch and scale
- [x] Show position once match is chosen
- [x] Add selector for position then automatically determine robot based on last match (but probably add a verification)
- [ ] Add checkbox for if robot can stack cubes on scale they don't own
- [ ] Add checkbox for getting on the platform
- [x] Improve field UI
- [x] Field for if robot can put a cube on top of another on the scale
- [x] Form validation
- [x] Match by match auto
- [ ] Admin page: set tba event key
- [x] Team validation
- [ ] Admin page: download scouting data and delete
- [x] Change climbing success to climbing bar
- [ ] Make admin privileges a column
- [x] Swap match # and robot position columns
- [x] lastMatch++
- [x] Specify red or blue on alliance score field
- [ ] Comment help text
- [ ] Admin trigger reload
- [ ] Admin console with most recent submissions
- [ ] Wagering
- [ ] User page
- [x] Match page
- [ ] Add x for x for percentages
- [ ] Add total switch and scale
- [ ] Freeze columns and rows?
- [ ] total projected rp

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

```
