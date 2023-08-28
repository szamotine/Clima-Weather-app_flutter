import 'package:flutter/material.dart';

//#region String constants
const String kFontSpartanMB = 'Spartan MB';
const String kCurrentWeather = "current_weather";
const String kTemperature = "temperature";
const String kWeatherCode = "weathercode";
const String kWindSpeed = "windspeed";
const String kDescriptionNotFound = "Description Not Found";
const String kLineBreak = '\n-------------------\n';

const double kDefaultLongitude = -113.00;
const double kDefaultLatitude = 53.00;
const String kDefaultCityName = "Default Location";
const String kCityNameError = 'Error';

//#endregion

//#region TextStyles
const TextStyle kTempTextStyle = TextStyle(
  fontFamily: kFontSpartanMB,
  fontSize: 100.0,
);

const TextStyle kMessageTextStyle = TextStyle(
  fontFamily: kFontSpartanMB,
  fontSize: 60.0,
);

const TextStyle kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: kFontSpartanMB,
);

const TextStyle kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const TextStyle kCityInputTextStyle = TextStyle(
  fontFamily: kFontSpartanMB,
  fontSize: 50.0,
  color: Colors.black,
);
//#endregion

//#region Weather Codes
const Map<int, String> weatherCodes = <int, String>{
  0: "Clear Sky",
  1: "Mainly clear ",
  2: "Partly cloudy",
  3: "Overcast",
  45: "Fog",
  48: "Depositing rime fog",
  51: "Light Drizzle",
  53: "Moderate Drizzle",
  55: "Dense Drizzle",
  56: "Light Freezing Drizzle",
  57: "Dense Freezing Drizzle",
  61: "Slight Rain",
  63: "Moderate Rain",
  65: "Heavy Rain",
  66: "Light Freezing Rain",
  67: "heavy Freezing Rain",
  71: "Slight Snow fall",
  73: "Moderate Snow fall",
  75: "Heavy Snow fall",
  77: "Snow grains",
  80: "Slight Rain showers",
  81: "Moderate Rain showers",
  82: "Violent Rain showers",
  85: "Slight Snow showers",
  86: "Heavy Snow showers",
  95: "Slight Thunderstorm",
  96: "Thunderstorm with Slight Hail",
  99: "Thunderstorm with Heavy Hail",
};

const Map<int, List<String>> weatherCodesAndIcons = <int, List<String>>{
  0: <String>["Clear Sky", '☀️☀️☀️'],
  1: <String>["Mainly clear ", '☀️☁️☀️'],
  2: <String>["Partly cloudy", '☁️☀️☁️'],
  3: <String>["Overcast", '☁️☁️☁️'],
  45: <String>["Fog", '☁️☁️☁️'],
  48: <String>["Depositing rime fog", '☁️☁️☁️'],
  51: <String>["Light Drizzle", '🌩'],
  53: <String>["Moderate Drizzle", '🌩 🌩'],
  55: <String>["Dense Drizzle", '🌧🌧'],
  56: <String>["Light Freezing Drizzle", '🌩☃️🌩'],
  57: <String>["Dense Freezing Drizzle", '🌧☃️🌧'],
  61: <String>["Slight Rain", '🌩'],
  63: <String>["Moderate Rain", '🌩🌩'],
  65: <String>["Heavy Rain", '🌧🌧🌧'],
  66: <String>["Light Freezing Rain", '☃️🌩☃️'],
  67: <String>["Heavy Freezing Rain", '☃️🌧☃️'],
  71: <String>["Slight Snow fall", "☃️"],
  73: <String>["Moderate Snow fall", "☃️☃️"],
  75: <String>["Heavy Snow fall", "☃️☃️☃️"],
  77: <String>["Snow grains", "☃️☃️"],
  80: <String>["Slight Rain showers", '☁️🌩☁️'],
  81: <String>["Moderate Rain showers", '☁️🌩🌩☁️'],
  82: <String>["Violent Rain showers", '☁️🌧☁️'],
  85: <String>["Slight Snow showers", '☁️☃️☁️'],
  86: <String>["Heavy Snow showers", '☁️☃️☃️☁️'],
  95: <String>["Slight Thunderstorm", '☔️'],
  96: <String>["Thunderstorm with Slight Hail", '☔️☁️☃️'],
  99: <String>["Thunderstorm with Heavy Hail", '☔️☁️☃️☔️'],
};

const Map<int, String> weatherCodesIcon = <int, String>{
  0: '☀️☀️☀️',
  1: '☀️☁️☀️',
  2: '☁️☀️☁️',
  3: '☁️☁️☁️',
  45: '☁️',
  48: '☁️',
  51: '🌩',
  53: '🌩',
  55: '🌧',
  56: '☃️🌩',
  57: '☃️🌧',
  61: '🌩',
  63: '🌩',
  65: '🌧',
  66: '☃️🌩',
  67: '☃️🌧',
  71: "☃️",
  73: "☃️☃️",
  75: "☃️☃️☃️",
  77: "☃️🌩",
  80: "☃️🌩",
  81: "☃️🌩",
  82: "☃️🌩",
  85: "☃️🌩",
  86: "☃️🌩",
  95: '☔️',
  96: '☔️',
  99: '☔️',
};
//#endregion
