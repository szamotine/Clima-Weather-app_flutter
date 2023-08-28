import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../screens/location_screen.dart';
import '../utilities/constants.dart';
import '../utilities/weather_data.dart';
import 'mylocation.dart';

class NetworkHelper {
  late double temp;

  static Future<Response> getWeatherData(double latitude, double longitude) async {
    final Uri httpsUri = Uri(
      scheme: 'https',
      host: 'api.open-meteo.com',
      path: '/v1/forecast',
      queryParameters: <String, dynamic>{'latitude': '$latitude', 'longitude': '$longitude', 'current_weather': 'true'},
    );

    final Response response = await get(httpsUri);

    if (response.statusCode == 200) {
      // final WeatherData wr = WeatherData(response);
      //  wr.printConditions();
    } else {
      // print('Status Code: ${response.statusCode}');
    }
    return response;
  }

  static Future<void> runGivenLocation(BuildContext context, MyLocation location) async {
    // print('$kLineBreak runGivenLocation to ${location.cityName} $kLineBreak');
    try {
      if (location.cityName == kDefaultCityName && location.latitude == kDefaultLatitude && location.longitude == kDefaultLongitude) {
        // print('$kLineBreak Changing city to current location due to Location Error $kLineBreak');
        location = await NetworkHelper.getCurrentLocation();
      }
      final WeatherData weatherData = await getWeatherDataFromLocation(location);

      // print('$kLineBreak Pushing screen for: ${weatherData.cityName} $kLineBreak');
      loadLocationScreen(context, weatherData);
    } catch (e) {
      // print('Error in runGivenLocation: $e');
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
