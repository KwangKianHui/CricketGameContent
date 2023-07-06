# cricket_game_content_app

Welcome to the documentation for the Cricket Game Content App. This app uses the free api from https://rapidapi.com/sportcontentapi/api/cricket-live-data/ to display contents regarding cricket games.
This app is deployed on: https://kwangkianhui.github.io/CricketGameContent/#/

Program Structure and UIUX prototype is available on the Figma link: https://www.figma.com/file/WgUOWU5hRL3x3xvkGmtaQI/Cricket-Game-Content?type=design&node-id=2%3A2&mode=design&t=4XSmA3A1CFISHSt0-1

## Table of Contents:
1) How To Run On Your Own Laptop
2) Program Structure
3) UIUX Prototype, Planning and Decisions
4) Code Details And Other Workflows





### 1) How To Run On Your Own Laptop 

Currently I have deployed the app on github with Github Pages. 

<img width="582" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/fdd41873-56db-48bc-851f-094d496e7dbb">

WEB: In order to run the Flutter app locally on your own laptop, you will need to change the web/index.html file. You will need to replace the code on line 17: "\<base href="https://kwangkianhui.github.io/CricketGameContent/">" to "\<base href="/">".

IOS/ANDROID: You will be able to run them without any changes made to the code.

The base href link was changed to facilitate the ease of deployment on Github Pages as I have used Github Actions to setup the CI/CD workflow. The workflow executes automatically each time I make any commits to the main branch. 





### 2) Program Structure

<img width="686" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/4fc07919-a3db-443d-8ed5-824a04e57684">

The program structure for this app will be designed based on MVVM design pattern. MVVM is preferred over other design patterns as it offers a clearer SoC between each component of the app which helps with testability of the app.

Presentation folder will hold all UI logic and/or widget codes along with any constant styling for the app (color, padding value, etc).

Application folder will hold all app logic and/or state management along with any classes for the app.

Data folder will hold all things related to API, data conversion and data transfer object (DTO) classes to facilitate conversion between app's classes and JSON.

In this app, all data sources will come from RapidAPI for their free cricket game data.





### 3) UIUX Prototype Planning and Decisions

<img width="598" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/4e333e56-7bb5-43fc-b185-b00aa920c444">

Before deciding what features or pages will be included in the app, I have first explored the sample response from each API endpoints to understand what type of data will be returned.

<img width="398" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/0a3e2ebf-505e-41ec-82ba-244f7d360e6c">

We can see from RapidAPI that there are a total of 7 different endpoints available for use. 1 specifically for series, 3 for fixtures, 2 for results and 1 for match scorecard.

Based on the sample responses from these endpoints, I identified 6 or more potential classes:

Series(series_id, series_name, status, season, updated_at)

Team(id, code, name)

Fixtures(id, match_title, match_subtitle, date, venue, status,, result, home:Team, away:Team, series_id)

Batting(id, player_id, player_name, balls, bat_order, fours, how_out, minutes, runs, sixes, strike_rate)

Bowling(id, player_id, player_name, dot_balls, economy, extras, fours, maidens, overs, runs_conceded, sixes, wickets)

LiveMatchDetails(home_scores, away_scores, in_play, result, status, toss, referee, umpire_1, umpire_2, umpire_reserve, umpire_tv, ...) -> other information which are part of "scorecard", and "stats" which could potentially lead to multiple classes being constructed

<img width="210" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/350b1be2-9060-484b-b6ff-b104cf3d44b1">

The features completed for this app will not be able to cover all endpoints due to time constraints. However, I will attempt to complete 3 pages, which will be called Series, Fixtures and Results page. These 3 pages will use 6 out of 7 endpoints.

<img width="920" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/138574641/cffa4216-2c31-4230-81a9-900e86420161">

For the UIUX of this app, I have done up a rough prototype of the features and pages the app will have using Figma. The final design will then be changed to a dark theme. I have not applied any UX concepts in the design to avoid spending too much time on designing the UI.

Referencing any typical sports info app, I have decided to implement the following features for each of the pages:

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

This app will be built as a single page application as this provides users with a more seamless/natural feel as opposed to multi page apps where users will experience more loading between pages as the navigate through different features. 





### 4) Code Details And Other Workflows

How I will develop the app will be to create a new branch for each page that I am working on. Once that page is completed, I will create a pull request to merge into the main branch. I will take this time to check my code again while the workflow is running. If all goes well, I will merge the code and the updated app will be deployed automatically to the same github.io url.

While working with an actual team, it will be ideal to break the pull requests into smaller chunks but since I am working on this project alone with limited time, I will overlook this bad practice for this project. 


##### 4.1) Classes:

In the project, I will be using freezed code generator to create classes. Freezed generated classes will help us implement copyWith method, toJson, fromJson methods and other methods that can be tedious. Even though there might not be the need to implement some of these methods, it can be convenient to have them available when required.

freezed_annotation: https://pub.dev/packages/freezed_annotation

json_annotation: https://pub.dev/packages/json_annotation

freezed: https://pub.dev/packages/freezed

The codes are generated using build_runner: https://pub.dev/packages/build_runner

##### 4.2) State Management and Provider: Flutter Riverpod - https://riverpod.dev/

Riverpod was selected as it is able to catch any errors during compilation instead of runtime. It also allow us to place the code in a shared state.

##### 4.3) App Responsiveness: Responsive Framework - https://pub.dev/packages/responsive_framework

<img width="584" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/3618d2dd-f917-47c2-a964-b106152b6252">

Responsive Framework is used to handle app's responsiveness. However, as this app does not contain any complex UI designs, it is not used widely in this project. However this package helps to apply any resizing or autoscaling for all device widths. This help to minimise potential overflow errors that might have been missed during the testing phase. 

We are also able to define our own custom breakpoints to control the resizing or autoscaling actions.

##### 4.4) Flow

In this section, I will talk about how a typical flow would look like along with the related codes. For this example, I will use the flow of how a user will retrieve a list of Series data from the "https://cricket-live-data.p.rapidapi.com/series" API.

###### 4.4.1) Initiate API request

###### lib/presentation/series_page_widgets/series_page_widget.dart:

<img width="584" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/19b8d418-8203-4ddc-8d81-a9ae6e9e51f5">

In this app, there are various user interactions that causes the app to initiate the API request. However, the most common way would be during the initial build of the page through initState() functions. In the initState functions, I will use Future.delayed() to allow the use of async to wait for the API request to be completed. 

###### 4.4.2) Creation of States

###### lib/application/series_state.dart:

<img width="404" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/c011cbb0-1224-45c1-bd29-045e27aa82b3">

We will first need to create the State class to hold all required states. For this app, I will focus on loading, on failure(error) and on success(display data), along with List of objects that will be retrieved. 

###### 4.4.3) StateNotifiers for app logic

###### lib/application/series_notifier.dart:

<img width="573" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/c9f6db5a-5504-4567-9044-576cd9114180">

The StateNotifiers held in "application" folder will hold all logic related to the application.

In each of the respective StateNotifiers, we will be handling the results differently. In the event that the API responds and we convert the data successfully, we will sort the List of SeriesClass object by its date from newest to the oldest date. Once complete, we will set loading and error state to false, and store the list in dataList.

If an exception was caught, we can map the results and update the states with the respective error messages. I have commented other errors out as I have not implemented them in the repository file.

###### 4.4.4) Repositories for error handling and DTO conversion 

###### lib/data/series_repository.dart:

<img width="653" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/e890a159-4a89-492c-b480-9177ce355b9f">

The Repository files held in "data" folder will be handling any errors along with conversion of Data Transfer Objects (DTO) to their respective classes.

The respective repository files will either receive the List of DTO objects or an exception from the remote service files. Using dartz package: https://pub.dev/packages/dartz, we can perform some functional programming. Using Either, we can return 2 different data types. 

If no exception was caught, we will proceed to convert the List of DTO objects into the respective List of class objects using .fromDTO function that has been developed when developing the DTO classes.

<img width="571" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/924da5b7-8052-422a-983d-67f9fb04569d">

If any exception is caught in this process, the function will return an exception. I have created a OperationFailure class which consists of some of the most common errors. However, in the repository files I have not implemented them. If I am to implement them, I will use the exception code of the exception caught "e.code" to determine which specific type of OperationFailure to return.

###### 4.4.5) Remote Services for API request and JSON conversion

###### lib/data/series_remote_service.dart:

<img width="594" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/7bf8a165-158e-49a9-9148-5e71d4d0c1f6">

The RemoteService files held in "data" folder will make the API request along with decoding and converting JSON objects to DTO objects.

If the API does not return a status code of 200 (exception 400+ or 500+ error codes), an Exception will be thrown. If the json data is decoded successfully, a List of DTO objects will be returned.

The API_TOKEN and API_HOST are variables that are stored in the lib/shared/api_key.dart. Usually, API keys should always be hidden by being included in .gitignore file or other methods, but for this project I will be exposing the API key so that the app can be launched by anyone else. This poses no risk even in the event of over usage as RapidAPI limits the number of requests to 250 per month and the API consists of only GET requests.

###### 4.4.6) Setting up providers

###### lib/shared/providers.dart:

<img width="787" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/bf214295-0d9f-48f9-a319-5c08f11b7070">

Next we will setup the providers so that we can access the states in our app.

###### 4.4.7) State management

###### lib/presentation/series_overview_widget.dart:

<img width="558" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/17d715d8-fd18-4c94-bc9d-d07570e8ebf7">

Now, whenever we need to access any of the providers, we simply have to change StatelessWidget -> ConsumerWidget or StatefulWidget -> ConsumerStatefulWidget. This allows us to use ref.read() or ref.watch() to get or listen for any updates to the state. In this case, I use ref.watch to listen to any changes to the SeriesNotifier's state. If it is loading, I display a CircularProgressIndicator, If there is no error, I display the intended body widget. If not, I will simply display the error state widget (in this case, just a text displaying the error message).

And that is the explanation for the flow of making an API request, along with error handling, and state management.

##### 4.5) Tests

For tests, I will only be performing unit tests, while end-to-end testing using flutter_integration_test package will not be performed in this project.

I will be using mocktail package to perform unit tests: https://pub.dev/packages/mocktail

###### test/series_widget_test.dart:

<img width="562" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/26f1d673-6470-47ff-89f4-fe8d99679ccd">

First, I created the mock objects required to perform the unit tests. For unit tests, I will be testing my StateNotifiers and Repositories. 

<img width="539" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/aecb5fc9-48a1-47e3-874a-110b9cc6f064">

Followed by mock data lists for use in tests.

<img width="556" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/0d22cf78-516c-4963-b36a-bf06e29b39b1">

Lastly, we will also have to initialise mock behaviours for tests.

<img width="585" alt="image" src="https://github.com/KwangKianHui/CricketGameContent/assets/22290289/2c93e860-4c27-4e15-b368-ce89d6e583e7">

The following tests are performed for StateNotifier (systemUnderTest1):
1) verify that the repository's function is only called once.
2) expect different states through execution (mock successful API result)
3) expect different states through execution (mock failed API result)

The following tests are performed for Repository (systemUnderTest2):
1) verify that the remote service's function is only called once.
2) expect class objects list to be equal to result of converted DTO objects list using .fromDTO() function
3) expect left OperationFailure result on mock failed API result

Next, I executed the tests using "flutter test --coverage". This allows us to generate a test coverage report. Next I will be excluding some files from the coverage report such as all "*_remote_service.dart" and any "*.g.dart" files. Remote service files are excluded as we do not test API requests. .g.dart files are excluded as these are auto generated functions (toJson and fromJson) that are not used in this project. In other projects which involves writing of JSON data using POST request, these will not be excluded.
