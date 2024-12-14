import 'package:practice_1/features/core/domain/entities/search_query.dart';
import 'package:practice_1/features/core/domain/repositories/weather_repository.dart';
import 'dart:io';

class App {
  final WeatherRepository repository;

  App(this.repository);

  void run() async {
    print('Введите \'city\' для получения погоды по городу,\n \'coords\' - для получения по координатам:');
    var type = stdin.readLineSync();
    if (type == 'city') {
      var city = stdin.readLineSync();
      if (city == null) {
        print('Ошибка ввода');
        return;
      }
      var resp = await repository.getWeather(SearchQuery(city));
      print('Погода в городе $city: ${resp.temp} по Цельсию, тип: ${resp.type}');
    }
    else if (type == 'coords') {
      print('Введите координаты x и y через пробел');
      var coords = stdin.readLineSync();
      if (coords == null) {
        print('Ошибка ввода');
        return;
      }
      var parts = coords.trim().split(' ');
      if (parts.length != 2) {
        print('Ошибка ввода');
        return;
      }
      try {
        var x = double.parse(parts[0]);
        var y = double.parse(parts[1]);
      }
      catch (e) {
        print("Ошибка: Введите числа через пробел!");
      }
    }
    else {
      print('Ошибка ввода');
    }
  }
}