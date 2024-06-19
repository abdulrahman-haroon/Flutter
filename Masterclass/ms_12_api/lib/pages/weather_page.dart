import 'package:flutter/material.dart';
import 'package:ms_12_api/models/weather_mode.dart';
import 'package:ms_12_api/services/weather_service.dart';

class WeatherPage extends StatelessWidget {
  final _weatherService = WeatherService('91cae0966aa3ef21b05545327623bcd2');
  Weather? weather;
  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
