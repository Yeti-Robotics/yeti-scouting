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

## Setup

### Installations

- Install Java JDK 11 [Download Page](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- Install VSCode with the Java Extension

Visual Studio Code: [Download Page](code.visualstudio.com). Once Visual Studio Code is installed you can navigate to the extentions tab and download the "Java Extention Pack" as well as "Lombok Annotations Support for VS Code". Visual Studio Code (otherwise known as vscode) is a code editor that we will write/edit our code in.

- Install NodeJs

NodeJs is the program that will run the front end website for the scouting site. [NodeJS Download Page](nodejs.org/en/).

- Install Docker or XAMPP

I recommend installing Docker if you are on Linux or Mac. If you are on windows, then install XAMPP.

If installing Docker open the terminal and run:
> sudo apt install docker
and
> sudo apt install docker-compose

The XAMPP download page is located [here](https://www.apachefriends.org/index.html)

- Yeti Robotics GitHub

Make sure that you have access to the Yeti Robotics Github, then you want to clone the repo called "Yeti Scouting".

### Setup

Now that we have installed everything we can start seting up the Yeti Scouting Site. Lets start by getting the backend server running, and then we will move to the front end website.

- Windows Instructions:

Use XAMPP to start the backend server. The server is in the Yeti Scouting Folder that you got off of github. Once it is started you can use your web browser and go to *localhost/phpmyadmin*. Here are the databases. The "scouting" folder of the database is not on the sidebar though, you will need to add that.

Once that is complete you can open VSCode and Open up the Yeti-Scouting Repo in Vscode. You can open the terminal using the menu at the top of the vscode window. In the terminal run `.\gradlew.bat bootRun` this task should stop at 75% and then the api is started.

All that is left to do is use Node.js to start the front end server. First open a new terminal using the plus sign. Then run the change directory command to move into the scouting-web folder, `cd scouting-web`. In scouting-web run `npm install` to install the node modules. (`npm` stands for "node package manager", just like `cd` stands for "change directory") After the node modules are done installing run `npm start` to start the front end server. Now you can go to *localhost:4200* on your web browser and you should we the Yeti Scouting Page! Woohoo!

- Linux and Mac Instructions:

The Linux and Mac Instructions are relativily simple, first, open VScode and open the folder Yeti-Scouting that you cloned off of github. Open the Terminal, and run the command `docker-compose up`. Once it is started you can use your web browser and go to *localhost:8000*. Here are the databases!

Open a new terminal window using the "+" button. Then run `./gradlew bootRun`, the program should run until it gets to 75% where it will pause. This step is done!

All that is left to do is use Node.js to start the front end server. First open a new terminal using the plus sign. Then run the change directory command to move into the scouting-web folder, `cd scouting-web`. In scouting-web run `npm install` to install the node modules. (`npm` stands for "node package manager", just like `cd` stands for "change directory") After the node modules are done installing run `npm start` to start the front end server. Now you can go to *localhost:4200* on your web browser and you should we the Yeti Scouting Page! Woohoo!


## Running Locally

### Database
Run Database server with Docker or XAMPP
- Mac & Linux: `docker-compose up`
- Windows: Use XAMPP Application

### API
Run the Gradle `bootRun` task
- Mac & Linux:  `./gradlew bootRun`
- Windows: `.\gradlew.bat bootRun`

### Website
Run Node.js to start the website
- Mac & Linux: `npm start`
- Windows: `npm start`

#### Local database
To view the database visit: 
http://localhost:8080/h2
- username: scouting
- password: scouting

#### Local Website
To view the website visit:
http://localhost:4200/
- username: user
- password: user

testing