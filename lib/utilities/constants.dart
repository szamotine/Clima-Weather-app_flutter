import 'package:flutter/material.dart';

const String kFontSpartanMB = 'Spartan MB';
const String kCurrentWeather = "current_weather";
const String kTemperature = "temperature";
const String kWeatherCode = "weathercode";
const String kWindSpeed = "windspeed";
const String kDescriptionNotFound = "Description Not Found";

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
