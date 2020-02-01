# Yeti Scouting

## Stuff to Add
- [x] Submit timeout stores form data to be submitted later or generate json to give to admin
- [ ] Just remove the score field, there's no hope
- [x] make admin page
- [ ] Ability to add matches to list in case of replays
- [ ] Add option for user to type in team and match number if internet is slow
- [ ] Fix match list
- [ ] Match page: add a not scouted check
- [ ] Admin: scout as
- [ ] Give bytecoins for scouting
- [ ] add graphs
- [ ] Fix placement of score on match page when a team wasn't scouted:  alliance colspan=teams.length
- [ ] Add a check for the invalid match label
- [ ] Make iced Java team
- [x] Limit score to positive numbers
- [ ] Add a loading spinner
- [ ] Add images of game pieces
- [ ] Deploy
- [ ] Disable keyboard input for apple users
- [x] Show position once match is chosen
- [ ] Add selector for position then automatically determine robot based on last match (but probably add a verification)
- [ ] Form validation
- [x] Admin page: set tba event key
- [x] Team validation
- [ ] Admin page: download scouting data and delete
- [x] Comment help text
- [ ] Admin trigger reload
- [ ] Admin console with most recent submissions
- [ ] Wagering
- [ ] User page
- [ ] Match page
- [ ] Add x for x for percentages
- [ ] Freeze columns and rows?
- [ ] total projected rp
- [x] form submission notice
- [ ] link data to a google sheet
- [ ] admin manipulation of data
- [ ] alliance selection
- [x] time stamps
- [x] move from h2 to mySQL
- [x] make it so averages aren't skewed by dupe matches
- [x] longer comment char limit (and tell the limit)
- [ ] brackets
- [ ] peaks
- [x] sort by columns
- [ ] add climbs to match data
- [ ] rate robots by stars
- [ ] reddit comment ranking system (w/medals for helpfulness)

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
