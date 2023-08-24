import 'package:clima/services/networking.dart';
import 'package:clima/utilities/weather_data.dart';
import 'package:flutter/material.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final Location myLocation = Location();

  late double latitude;
  late double longitude;
  late WeatherData weatherData;

  Future<void> getLocation() async {
    try {
      final NetworkHelper networkHelper = NetworkHelper();
      await myLocation.getCurrentLocation();
      latitude = myLocation.latitude;
      longitude = myLocation.longitude;
      weatherData = WeatherData(await networkHelper.getWeatherData(latitude, longitude));
      weatherData.printConditions();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
            //getData();
            // _determinePosition(); //Get the current location
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //getLocation();
  }
}
