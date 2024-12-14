import 'package:practice_1/features/core/data/debug/weather_repository_debug.dart';
import 'package:practice_1/features/core/data/osm/osm_api.dart';
import 'package:practice_1/features/core/data/osm/weather_repository_osm.dart';
import 'package:practice_1/features/core/presentation/app.dart';


const String apiURL = 'http://api.weatherapi.com';
const String apiKey = 'b19ddde0394c4411878170759241412';

void main(List<String> arguments) {
  var app = App(WeatherRepositoryOSM(OSMApi(apiURL, apiKey)));

  app.run();
}
