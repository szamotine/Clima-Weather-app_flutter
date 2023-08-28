import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/mylocation.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/weather_data.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weatherData});

  final WeatherData weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late WeatherData weatherData = widget.weatherData;

  Future<void> updateUI() async {
    try {
      final MyLocation location = MyLocation();
      await location.getCurrentLocation();

      weatherData = WeatherData(await NetworkHelper.getWeatherData(location.latitude, location.longitude), location.cityName);
      setState(() {
        // print('Got Coordinates: \nLat: ${location.latitude} \nLong: ${location.longitude}  \nCity: ${location.cityName}');
      });
    } catch (e) {
      // print('Error in updateUI: $e');
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('$kLineBreak Building location screen $kLineBreak');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FilledButton(
                    onPressed: () async {
                      updateUI();
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) {
                            return const CityScreen();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${weatherData.currentTemperature}°',
                        style: kTempTextStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        weatherCodesAndIcons[weatherData.weatherCode]?[1] ?? '',
                        style: kConditionTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherModel.getMessage(weatherData.currentTemperature)} in ${weatherData.cityName}!",
                  textAlign: TextAlign.left,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
