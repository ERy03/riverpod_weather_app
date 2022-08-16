import 'dart:math';
import 'package:riverpod_weather_app/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  late double cachedTempCelsius;

  @override
  Future<Weather> fetchWeather(String cityName) {
    return Future.delayed(const Duration(seconds: 1), () {
      final random = Random();

      if (random.nextBool()) {
        throw NetworkException();
      }

      cachedTempCelsius = 20 + random.nextInt(15) + random.nextDouble();

      return Weather(
        cityName: cityName,
        temperatureCelsius: cachedTempCelsius,
      );
    });
  }
}

class NetworkException implements Exception {}
