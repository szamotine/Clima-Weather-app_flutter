import 'dart:convert';

import 'package:http/http.dart';

import 'constants.dart';

class WeatherData {
  WeatherData(this.response) {
    data = response.body;
    decodedData = jsonDecode(data);
    currentTemperature = decodedData[kCurrentWeather][kTemperature];
    weatherCode = decodedData[kCurrentWeather][kWeatherCode];
    windSpeed = decodedData[kCurrentWeather][kWindSpeed];
    weatherCodeDescription = weatherCodes[weatherCode] ?? kDescriptionNotFound;
  }
  final Response response;
  late final String data;
  late final dynamic decodedData;
  late final double currentTemperature;
  late final int weatherCode;
  late final double windSpeed;
  late final String weatherCodeDescription;

  void printConditions() {
    print(
        'Current Temperature: $currentTemperature \n Current Wind Speed: $windSpeed \n Current Weather Code: $weatherCode \n Weather Code Description: $weatherCodeDescription');
  }
}
