# cricket_game_content_app

Welcome to the documentation for the Cricket Game Content App. This app uses the free api from https://rapidapi.com/sportcontentapi/api/cricket-live-data/ to display contents regarding cricket games.
This app is deployed on: https://kwangkianhui.github.io/CricketGameContent/#/

Program Structure and UIUX prototype is available on the Figma link: https://www.figma.com/file/WgUOWU5hRL3x3xvkGmtaQI/Cricket-Game-Content?type=design&node-id=2%3A2&mode=design&t=4XSmA3A1CFISHSt0-1

## Table of Contents:
1) Program Structure
2) UIUX Prototype, Planning and Decisions
3) How To Run On Your Own Laptop And Other Workflows
4) Code Details

### 1) Program Structure

<img width="686" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/4fc07919-a3db-443d-8ed5-824a04e57684">

The program structure for this app will be designed based on MVVM clean architecture. MVVM is preferred over other design patterns as it offers a clearer SoC between each component of the app which helps with testability of the app.

Presentation folder will hold all UI logic and/or widget codes along with any constant styling for the app (color, padding value, etc).

Application folder will hold all app logic and/or state management along with any classes for the app.

Data folder will hold all things related to API, data conversion and data transfer object (DTO) classes to facilitate conversion between app's classes and JSON.

In this app, all data sources will come from RapidAPI for their free cricket game data.


### 2) UIUX Prototype Planning and Decisions

<img width="598" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/4e333e56-7bb5-43fc-b185-b00aa920c444">

Before deciding what features or pages will be included in the app, I have first explored the sample response from each API endpoints to understand what type of data will be returned.

<img width="398" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/0a3e2ebf-505e-41ec-82ba-244f7d360e6c">

We can see from RapidAPI that there are a total of 7 different endpoints available for use. 1 specifically for series, 3 for fixtures, 2 for results and 1 for match scorecard.

Based on the sample responses from these endpoints, we can identify that there could be more than 6 potential classes:

Series(series_id, series_name, status, season, updated_at)

Team(id, code, name)

Fixtures(id, match_title, match_subtitle, date, venue, status,, result, home:Team, away:Team, series_id)

Batting(id, player_id, player_name, balls, bat_order, fours, how_out, minutes, runs, sixes, strike_rate)

Bowling(id, player_id, player_name, dot_balls, economy, extras, fours, maidens, overs, runs_conceded, sixes, wickets)

LiveMatchDetails(home_scores, away_scores, in_play, result, status, toss, referee, umpire_1, umpire_2, umpire_reserve, umpire_tv, ...) -> other information which are part of "scorecard", and "stats" which could potentially lead to multiple classes being constructed

<img width="210" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/350b1be2-9060-484b-b6ff-b104cf3d44b1">

The features completed for this app will not be able to cover all endpoints due to the interest of time. However, I will attempt to complete 3 pages, which will be called Series, Fixtures and Results page. These 3 pages will use 6 out of 7 endpoints.

<img width="920" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/cffa4216-2c31-4230-81a9-900e86420161">

For the UIUX of this app, I have done up a rough prototype of the features and pages the app will have using Figma. The final design will then be changed to a dark theme. No UX concepts were used in the design.

Referencing a typical sports info app, I have decided to implement the following features for each of the pages:

Series Page:

1) Act as the home page
2) Home page will display top 10 of the upcoming and ongoing(current) series sorted by latest updated date
3) Users may view more upcoming and ongoing series
4) Users may view each series in details (detail page), which includes fixtures that are a part of the series

APIs used:

1) https://cricket-live-data.p.rapidapi.com/series
2) https://cricket-live-data.p.rapidapi.com/fixtures-by-series/[SERIES_ID]

Fixtures Page:

1) Users can view the next 50 upcoming fixtures
2) Users can view each fixture in details (detail page)
3) Users can filter fixtures for a given date

APIs used:

1) https://cricket-live-data.p.rapidapi.com/fixtures
2) https://cricket-live-data.p.rapidapi.com/fixtures-by-date/[FILTER_DATE]

Results Page:

1) Users can view fixtures with results
2) Users can view each fixture in details (detail page) -> fixture detail page can be used 
3) Users can filter fixtures with results for a given date

APIs used:
1) https://cricket-live-data.p.rapidapi.com/results
2) https://cricket-live-data.p.rapidapi.com/results-by-date/[FILTER_DATE]


### 3) How To Run On Your Own Laptop And Other Workflows

Currently I have deployed the app on github with Github Pages. 

<img width="582" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/fdd41873-56db-48bc-851f-094d496e7dbb">

WEB: In order to run the Flutter app locally on your own laptop, you will need to change the index.html file. You will need to replace <base href="https://kwangkianhui.github.io/CricketGameContent/"> to <base href="/"> on line 17.

The base href link was changed to facilitate the ease of deployment on Github Pages as I have used Github Actions to setup the CI/CD workflow. The workflow executes automatically each time I make any commits to the main branch. 

How I will develop the app will be to create a new branch for each page that I am working on. Once that page is completed, I will create a pull request to merge into the main branch. I will take this time to check my code again while the workflow is running. If all goes well, I will merge the code and the updated app will be deployed automatically to the same github.io url.

While working with an actual team, it will be ideal to break the pull requests into smaller chunks but since I am working on this project alone with limited time, I will overlook this bad practice for this project. 

API Token



### Code Details

