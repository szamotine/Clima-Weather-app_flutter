import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  final SpinKitSpinningLines spinKit = SpinKitSpinningLines(
    color: Colors.white,
    size: 100,
  );

  Future<void> getLocation() async {
    try {
      final NetworkHelper networkHelper = NetworkHelper();
      await myLocation.getCurrentLocation();
      latitude = myLocation.latitude;
      longitude = myLocation.longitude;
      weatherData = WeatherData(await networkHelper.getWeatherData(latitude, longitude), myLocation.cityName);
      weatherData.printConditions();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinKit,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }
}
