import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice_3/features/core/data/osm/models/osm_weather.dart';

class OSMApi {
  final String url;
  final String apiKey;

  OSMApi(this.url, this.apiKey);

  Future<OSMWeather> getWeather(String city) async {
    var response = await http.get(Uri.parse('$url/v1/current.json?key=$apiKey&q=$city&aqi=yes'));
    var rJson = jsonDecode(response.body);

    return OSMWeather(rJson['current']['temp_c'], rJson['current']['condition']['text']);
  }

  Future<OSMWeather> getWeatherByCoodrs(double x, double y) async {
    var response = await http.get(Uri.parse('$url/v1/current.json?key=$apiKey&q=$x,$y&aqi=yes'));
    var rJson = jsonDecode(response.body);

    return OSMWeather(rJson['current']['temp_c'], rJson['current']['condition']['text']);
  }
}