import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../screens/location_screen.dart';
import '../utilities/constants.dart';
import '../utilities/weather_data.dart';
import 'my_location.dart';

class NetworkHelper {
  late double temp;

  static Future<Response> getWeatherData(double latitude, double longitude) async {
    final Uri httpsUri = Uri(
      scheme: 'https',
      host: 'api.open-meteo.com',
      path: '/v1/forecast',
      queryParameters: <String, dynamic>{'latitude': '$latitude', 'longitude': '$longitude', 'current_weather': 'true'},
    );

    return await get(httpsUri);
  }

  static Future<void> runGivenLocation(BuildContext context, MyLocation location) async {
    try {
      if (location.cityName == kDefaultCityName && location.latitude == kDefaultLatitude && location.longitude == kDefaultLongitude) {
        location = await NetworkHelper.getCurrentLocation();
      }
      final WeatherData weatherData = await getWeatherDataFromLocation(location);
      loadLocationScreen(context, weatherData);
    } catch (e) {
      return Future<void>.error('Error in runGivenLocation: $e');
    }
  }

  static Future<MyLocation> getCurrentLocation() async {
    final MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();
    return myLocation;
  }

  static Future<WeatherData> getWeatherDataFromLocation(MyLocation location) async {
    return WeatherData(await NetworkHelper.getWeatherData(location.latitude, location.longitude), location.cityName);
  }

  static void loadLocationScreen(BuildContext context, WeatherData weatherData) {
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
  }
}
