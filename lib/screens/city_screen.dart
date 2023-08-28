import 'package:clima/services/mylocation.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../services/networking.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late MyLocation myLocation = MyLocation();
  late String cityName;
  late WeatherData weatherData;

  Future<void> getCoordinates(String input) async {
    final List<Location> locationList = await myLocation.getCoordinateFromName(input);

    if (locationList.isEmpty) {
      myLocation.latitude = kDefaultLatitude;
      myLocation.longitude = kDefaultLongitude;
      myLocation.cityName = kCityNameError;
    } else {
      myLocation.latitude = locationList[0].latitude;
      myLocation.longitude = locationList[0].longitude;
      myLocation.cityName = cityName;
    }
    // print('Got Coordinates: \nLat: ${myLocation.latitude} \nLong: ${myLocation.longitude}  \nCity: ${myLocation.cityName}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: kCityInputTextStyle,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (String input) {
                    cityName = input;
                  },
                  onSubmitted: (String input) async {
                    await getCoordinates(input);
                    await NetworkHelper.runGivenLocation(context, myLocation);
                    // await getWeatherData();
                  },
                ),
              ),
              Column(
                children: <Widget>[
                  FilledButton(
                    onPressed: () async {
                      await getCoordinates(cityName);
                      await NetworkHelper.runGivenLocation(context, myLocation);
                    },
                    child: const Text(
                      'Get Weather',
                      style: kButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
