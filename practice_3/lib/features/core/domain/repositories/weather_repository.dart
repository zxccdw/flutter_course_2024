import 'package:practice_3/features/core/domain/entities/search_query.dart';
import 'package:practice_3/features/core/domain/entities/search_response.dart';

abstract class WeatherRepository {
  Future<SearchResponse> getWeather(SearchQuery query);
}