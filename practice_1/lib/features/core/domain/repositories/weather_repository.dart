import 'package:practice_1/features/core/domain/entities/search_query.dart';
// import 'package:practice_1/features/core/domain/entities/search_query_by_coords.dart';
import 'package:practice_1/features/core/domain/entities/search_response.dart';

abstract class WeatherRepository {
  Future<SearchResponse> getWeather(SearchQuery query);
  // Future<SearchResponse> getWeatherByCoords(SearchQueryByCoords query);
}