# weatherapp

Weather App is an app which displays weather forecast of 5 days.
Flutter Version: 3.7.5 (chanel stable)
Dart Version: 2.19.2

## Getting Started

Weather App follows Clean Architecture.

Api Key has been stored in firebase for security purpose. 

When app opens for the first time firestore database is invoked and weatherApiKey is fetched and stored locally in shared preference.

Then user navigates to Weather page. Initially EmptyWeather screen is shown when user searches weather forecast by city name , weather forecast of 5 days is shown.


