

import '../../data/model/weather_model/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeatherForecastByCity(String cityName);
}