import 'package:clima/utilities/constants.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation {
  MyLocation() {
    latitude = kDefaultLatitude;
    longitude = kDefaultLongitude;
    cityName = kDefaultCityName;
  }
  late Location ll;

  /// The latitude of this position in degrees normalized to the interval -90.0
  /// to +90.0 (both inclusive).
  late double latitude;

  /// The longitude of the position in degrees normalized to the interval -180
  /// (exclusive) to +180 (inclusive).
  late double longitude;

  late String cityName;

  Future<MyLocation> getCurrentLocation() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        timeLimit: const Duration(seconds: 3),
      );

      latitude = position.latitude;
      longitude = position.longitude;
      cityName = await getCityFromCoordinates();
    } catch (e) {
      print(e);
      //default values - ft sask
      print('$kLineBreak Using default values for location $kLineBreak');
      latitude = kDefaultLatitude;
      longitude = kDefaultLongitude;
      cityName = kDefaultCityName;
    }
    return this;
  }

  Future<String> getCityFromCoordinates() async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      return placemarks[0].locality ?? "Locality Error";
    } catch (e) {
      print('$kLineBreak Error in getCityFromCoordinates: $e $kLineBreak');
      return Future<String>.error(e.toString());
    }
  }

  Future<List<Location>> getCoordinateFromName(String input) async {
    final List<Location> location;
    try {
      // final List<Location> location = await locationFromAddress(input);
      location = await locationFromAddress(input);
      return location;
    } catch (e) {
      print('$kLineBreak Error in getCoordinateFromName: $e $kLineBreak');
      return List<Location>.empty();
    }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future<Position>.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future<Position>.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future<Position>.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    final Position position = await Geolocator.getCurrentPosition();
    print('Current Location determined: $position');
    return position;
  }
}
