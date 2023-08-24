import 'package:http/http.dart';

class NetworkHelper {
  Future<Response> getWeatherData(double latitude, double longitude) async {
    final Uri httpsUri = Uri(
      scheme: 'https',
      host: 'api.open-meteo.com',
      path: '/v1/forecast',
      queryParameters: <String, dynamic>{'latitude': '${latitude}', 'longitude': '${longitude}', 'current_weather': 'true'},
    );

    final Response response = await get(httpsUri);

    if (response.statusCode == 200) {
      // final WeatherData wr = WeatherData(response);
      //  wr.printConditions();
    } else {
      print('Status Code: ${response.statusCode}');
    }
    return response;
  }
}
