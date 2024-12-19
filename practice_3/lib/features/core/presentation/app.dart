import 'package:practice_3/features/core/data/home_page.dart';
import 'package:practice_3/features/core/data/osm/weather_repository_osm.dart';
import 'package:practice_3/features/core/data/osm/osm_api.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(wr: WeatherRepositoryOSM(OSMApi('http://api.weatherapi.com', 'b19ddde0394c4411878170759241412'))),
    );
  }
}
//
// class App {
//   final WeatherRepository repository;
//
//   App(this.repository);
//
//   void run() async {
//     print('Введите \'city\' для получения погоды по городу,\n \'coords\' - для получения по координатам:');
//     var type = stdin.readLineSync();
//     var x, y;
//     if (type == 'city') {
//       print('Введите город');
//       var city = stdin.readLineSync();
//       if (city == null) {
//         print('Ошибка ввода');
//         return;
//       }
//       var resp = await repository.getWeather(SearchQuery.city(city));
//       print('Погода в городе $city: ${resp.temp} по Цельсию, тип: ${resp.type}');
//     }
//     else if (type == 'coords') {
//       print('Введите широту и долготу через пробел');
//       var coords = stdin.readLineSync();
//       if (coords == null) {
//         print('Ошибка ввода');
//         return;
//       }
//       var parts = coords.trim().split(' ');
//       if (parts.length != 2) {
//         print('Ошибка ввода');
//         return;
//       }
//       try {
//         x = double.parse(parts[0]);
//         y = double.parse(parts[1]);
//       }
//       catch (e) {
//         print("Ошибка: Введите числа через пробел!");
//       }
//       var resp = await repository.getWeather(SearchQuery.coords(x, y));
//       print('Погода в городе $x, $y: ${resp.temp} по Цельсию, тип: ${resp.type}');
//     }
//     else {
//       print('Ошибка ввода');
//     }
//   }
// }