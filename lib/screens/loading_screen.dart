import 'package:clima/services/networking.dart';
import 'package:clima/utilities/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/mylocation.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.location});
  final MyLocation location;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  late WeatherData weatherData;
  final SpinKitSpinningLines spinKit = const SpinKitSpinningLines(
    color: Colors.white,
    size: 100,
  );

  late Future<MyLocation> myLocation;

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

    NetworkHelper.runGivenLocation(context, widget.location);
  }
}
