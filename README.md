# RUC 2018 1st Semester Spring

RUC 1st Semester (2018 Spring) information, useful links, teaching materials, excercises and other projects.

## General info

- [Collection of all links at RUC](https://portalino.ruc.dk/)
- [Outlook Web App (RUC Email)](https://owa.ruc.dk/) - Microsoft Exchange
- [RUC Intranet](https://intra.ruc.dk/)
- [RUC Moodle](https://moodle.ruc.dk)
- [Office 365 account](https://portal.office.com) - Use your RUC SSO login (same as intranet, webmail, moodle, etc.)
  - Usual Microsoft Office package
  - OneDrive (1TB free storage)
  - ~~Microsoft Teams (Slack alternative)~~
- [STADS](https://stadssb.ruc.dk/sb_stax/sb/) - Intranet link doesn't work correctly, this one does!
- [Kursuskatalog (kursus.ruc.dk)](http://kursus.ruc.dk/)
- [RUC VPN](https://intra.ruc.dk/index.php?id=23136&L=1) - Cisco AnyConnect VPN
- [Setup Eduroam WiFi](https://intra.ruc.dk/en/employees/services-to-employees/ruc-finance-it-technical-services/ruc-it/guides/internet-access/eduroam/)
- islb.ruc.dk MySQL Database:
  - Connection: `islb.ruc.dk`, port `3306` (`islb.ruc.dk:3306`)
  - Username: `guest`
  - Password: `guest`
- wt-220.ruc.dk MySQL Database:
  - Connection: `wt-220.ruc.dk`, port `3306` (`wt-220.ruc.dk:3306`)
  - Username: _your RUC username_
  - Password: _your given password (check your RUC E-mail)_

---

## RAWDATA

- [RAWDATA on Moodle](https://moodle.ruc.dk/course/view.php?id=9722)
- [RAWDATA intro](/RAWDATA/2018-feb-02/RAWDATA_intro_spring_2018.pdf)

### RAWDATA Lectures

- [February 02](/RAWDATA/2018-feb-02)
  - [DBMS intro.pdf](/RAWDATA/2018-feb-02/DBMS_intro.pdf)
  - [SQL_part1.pdf](/RAWDATA/2018-feb-02/SQL_part1.pdf)
  - Intro to the course
  - Database theory and excercises
- [February 06](/RAWDATA/2018-feb-06)
  - [SQL_part1.pdf](/RAWDATA/2018-feb-06/SQL_part1.pdf)
  - [SQL_part2.pdf](/RAWDATA/2018-feb-06/SQL_part2.pdf)
- [February 13](/RAWDATA/2018-feb-13)
  - [SQL_part2.pdf](/RAWDATA/2018-feb-06/SQL_part2.pdf)
  - [RM_intro.pdf](/RAWDATA/2018-feb-13/RM_intro.pdf)
- [February 15](/RAWDATA/2018-feb-15)
  - [ER-model.pdf](/RAWDATA/2018-feb-15/ER-model.pdf)
- [February 20](/RAWDATA/2018-feb-20)
  - [SQL_part3.pdf](/RAWDATA/2018-feb-20/SQL_part3.pdf)
  - [normalization_part1.pdf](/RAWDATA/2018-feb-20/normalization_part1.pdf)
- [February 22](/RAWDATA/2018-feb-22)
- [March 06](/RAWDATA/2018-mar-06)
  - [lecture1-introduction.pdf](/RAWDATA/2018-mar-06/lecture1-introduction.pdf)
  - [exercises.pdf](/RAWDATA/2018-mar-06/exercises.pdf)
- [March 08](/RAWDATA/2018-mar-08)
  - [lecture2-networks.pdf](/RAWDATA/2018-mar-08/lecture2-networks.pdf)
- [March 13](/RAWDATA/2018-mar-13)
  - [lecture3-adv.pdf](/RAWDATA/2018-mar-13/lecture3-adv.pdf)
  - [exercise2.3.pdf](/RAWDATA/2018-mar-13/exercise2.3.pdf)
- [March 15](/RAWDATA/2018-mar-15)
  - [lecture4-linq_ado.pdf](/RAWDATA/2018-mar-15/lecture4-linq_ado.pdf)
- [March 20](/RAWDATA/2018-mar-20)
  - [lecture5-http_asp.pdf](/RAWDATA/2018-mar-20/lecture5-http_asp.pdf)
  - [ASP.NET_MVC_Succinctly.pdf](/RAWDATA/2018-mar-20/ASP.NET_MVC_Succinctly.pdf)
  - [HTTP_Succinctly.pdf](/RAWDATA/2018-mar-20/HTTP_Succinctly.pdf)
  - [Software_Design_Patterns.pdf](/RAWDATA/2018-mar-20/Software_Design_Patterns.pdf)
- [March 22](/RAWDATA/2018-mar-22)
  - [lecture6-web_services.pdf](/RAWDATA/2018-mar-22/lecture6-web_services.pdf)

### RAWDATA Assignments

- [1st Assignment](/RAWDATA/2018-feb-06/RAWDATA_2018-Assignment_1.pdf)
  - Deadline: **Tuesday, 13 February 2018, 11:55 PM**
  - Queries using the `imdb_movie` database on `islb.ruc.dk:3306`
  - Hand-in on Moodle
  - Group hand-in is allowed
- [2nd Assignment](/RAWDATA/Assignments/Assignment2/RAWDATA_2018_-_Assignment_2.pdf)
  - Deadline: **Thursday, 22 February 2018, 11:55 PM**
  - Queries using the `imdb_movie` and your own database on `wt-220.ruc.dk:3306`
  - Hand-in on Moodle
  - Group hand-in is allowed
- [3rd Assignment](/RAWDATA/Assignments/Assignment3/RAWDATA-Assignment-3.pdf)
  - Deadline: **Monday, 12 March 2018, 11:55 PM**
  - Network Programming
  - Fork [this GitHub repo](https://github.com/bulskov/RAWDATA2018F_Assignment3TestSuite), and complete the exercise
  - Hand-in on Moodle and GitHub
  - Group hand-in is allowed
- [4th Assignment](/RAWDATA/Assignments/Assignment4/)
  - Deadline: **Monday, 21 March 2018, 11:55 PM**
  - Assignment 4 is separated into 2 parts, but both parts should be handed in together!
  - Hand-in on Moodle and GitHub
  - Group hand-in is allowed
  - [Part 1](/RAWDATA/Assignments/Assignment4/RAWDATA_2018-Assignment_4_part_I.pdf)
    - Data Layer with Entity Framework Core based on the Northwind database
    - Fork [this GitHub repo](https://github.com/bulskov/RAWDATA2018F_Assignment4TestSuite), and complete the exercise
  - [Part 2](/RAWDATA/Assignments/Assignment4/RAWDATA_2018-Assignment_4.pdf)
    - Create a web service for the Part 1 of this exercise.
    - The unit tests can be fount on [GitHub](https://github.com/bulskov/RAWDATA2018F_Assignment4Part2TestSuite)

### RAWDATA Project Portfolio

- The goal of the RAWDATA Project Portfolio is to build a functioning, simplifed version of [Stack Overflow](https://stackoverflow.com/).
- [Info about the project portfolio](/RAWDATA/Project_Portfolio/Subproject_1/RAWDATA_Portfolio_Project_1_intro.pdf)
- [RAWDATA Portfolio Project on Moodle](https://moodle.ruc.dk/course/view.php?id=9754)

#### [Subproject 1](/RAWDATA/Project_Portfolio/Subproject_1)

- Deadline: **Monday, 5 March 2018**
- [General info](/RAWDATA/Project_Portfolio/Subproject_1/RAWDATA_Portfolio_Project_1_intro.pdf)
- [Requirements](/RAWDATA/Project_Portfolio/Subproject_1/RAWDATA_F2018-Portfolio_subproject_1_requiments.pdf)
- Goal: to provide a database for the SOVA application and to prepare the key functionality of the application.
  - Two independent data models:
    - a QA-data model
      - All data from the source database ([stackoverflow_sample_universal.zip](/RAWDATA/Project_Portfolio/Subproject_1/stackoverflow_sample_universal.zip))
    - a history and marking model
  - Provide support for:
    - browsing and search for answers
    - personal activity history and marking of special interest posts.

#### [Subproject 2](/RAWDATA/Project_Portfolio/Subproject_2)

- Deadline: **Monday, 9 April 2018, 11:55 PM**
- [Requirements](/RAWDATA/Project_Portfolio/Subproject_2/RAWDATA_F2018-Portfolio-subproject_2_requirements.pdf)

---

## Robotics

- [Robotics on Moodle](https://moodle.ruc.dk/course/view.php?id=9760)
- [LeJOS EV3 API documentation](http://www.lejos.org/ev3/docs/)

### Robotics Lectures

- [February 14](/Robotics/2018-feb-14)
  - Intro to the course
  - Theory
  - [Exercises](/Robotics/2018-feb-14/BSIM_exercise.pdf)
- [February 21](/Robotics/2018-feb-21)
  - [Slides](/Robotics/2018-feb-21/RobotSlides-Day2.pdf)
  - [Exercises](/Robotics/2018-feb-21/RobotsExercisesDay2.pdf)
- [February 28](/Robotics/2018-feb-28)
  - [Slides](/Robotics/2018-feb-28/Slides_day3.pdf)
  - [1st assignment and exercises](/Robotics/2018-feb-28/Assignment-1+exercise.pdf)
- [March 07](/Robotics/2018-mar-07)
  - [Java Threads](/Robotics/2018-mar-07/java-threads-tutorial.pdf)
  - [High Level Sensors](/Robotics/2018-mar-07/HighLevelSensors.pdf)
- [March 14](/Robotics/2018-mar-14)
  - [Slides](/Robotics/2018-mar-14/Behaviours.pdf)
  - [Behavior Examples And MotorSync](/Robotics/2018-mar-14/BehaviorExamplesAndMotorSync.pdf)
  - [BehaviourProgrLeJOS-Tutorial.pdf](/Robotics/2018-mar-14/BehaviourProgrLeJOS-Tutorial.pdf)
- [March 21](/Robotics/2018-mar-21)
  - [Slides](/Robotics/2018-mar-21/WifiBluetooth.pdf)
  - [Notes](/Robotics/2018-mar-21/NoteWifiBluetooth.pdf)
  - [BT Exercises](/Robotics/2018-mar-21/BluetoothExercise.pdf)

### Robotics Assignments

- [1st assignment](/Robotics/2018-feb-28/Assignment-1+exercise.pdf)
  - Deadline: **Wednesday, 14 March 2018, 8:15 AM**
  - Hand-in on Moodle
  - Individual report hand-in. The robot can be a group work, but the report should be individual
