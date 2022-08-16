import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_app/repository/weather_repository.dart';
import 'package:riverpod_weather_app/weather_notifier.dart';

final weatherRepositoryProvider =
    Provider<WeatherRepository>((ref) => FakeWeatherRepository());

final weatherNotifierProvider = StateNotifierProvider(
    (ref) => WeatherNotifier(ref.watch(weatherRepositoryProvider)));
