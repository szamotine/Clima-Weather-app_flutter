import 'package:flutter/material.dart';

import '../screens/location_screen.dart';
import '../utilities/weather_data.dart';
import 'mylocation.dart';
import 'networking.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 19) {
      return 'Time for 🩳 and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  static Future<void> loadLocationScreen(BuildContext context) async {}

  static Future<void> getLocation(BuildContext context) async {
    try {
      final MyLocation myLocation = MyLocation();
      //final NetworkHelper networkHelper = NetworkHelper();
      await myLocation.getCurrentLocation();
      final double latitude = myLocation.latitude;
      final double longitude = myLocation.longitude;
      final WeatherData weatherData = WeatherData(await NetworkHelper.getWeatherData(latitude, longitude), myLocation.cityName);
      //weatherData.printConditions();
      Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) {
            return LocationScreen(
              weatherData: weatherData,
            );
          },
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
