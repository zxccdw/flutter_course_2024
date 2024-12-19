import 'package:flutter/material.dart';

import 'package:practice_3/features/core/domain/entities/search_query.dart';
import 'package:practice_3/features/core/data/osm/weather_repository_osm.dart';

class MyHomePage extends StatefulWidget {
  final WeatherRepositoryOSM wr;

  const MyHomePage({Key? key, required this.wr}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = TextEditingController();
  String userInput = "Space";
  String city = "Space";
  String weatherInfo = "-1";
  String weatherUlyanovsk = "";

  @override
  void initState() {
    super.initState();
    _controller.text = userInput;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getWeather() async {
    final result = await widget.wr.getWeather(SearchQuery.city(city));

    setState(() {
      weatherInfo = (result.temp).toString();
    });
  }
  Future<void> _getWeatherUlyanovsk() async {
    setState(() {
      city = "Ulyanovsk";
    });
    _getWeather();
  }

  void _setCity() {
    setState(() {
      city = userInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Температура в городе"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Введите название города по-английски",
                      ),
                      onChanged: (value) {
                        setState(() {
                          userInput = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      _setCity();
                      _getWeather();
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.pink,
                      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Найти'),
                  )
                ]
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                _getWeatherUlyanovsk();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Погода в Ульяновске'),
            ),
            const SizedBox(height: 20),
            Text(
              "Температура в ${city}: ${weatherInfo}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}