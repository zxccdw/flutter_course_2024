import 'package:practice_3/features/core/data/osm/osm_api.dart';
import 'package:practice_3/features/core/domain/entities/search_query.dart';
import 'package:practice_3/features/core/domain/entities/search_response.dart';
import 'package:practice_3/features/core/domain/repositories/weather_repository.dart';

class WeatherRepositoryOSM implements WeatherRepository {
  final OSMApi _api;

  WeatherRepositoryOSM(this._api);

  @override
  Future<SearchResponse> getWeather(SearchQuery query) async {
    var response;
    if (query.city != '') {
      response = await _api.getWeather(query.city);
    }
    else {
      response = await _api.getWeatherByCoodrs(query.x, query.y);
    }
    return SearchResponse(response.temp.toInt(), response.type);
  }
}
