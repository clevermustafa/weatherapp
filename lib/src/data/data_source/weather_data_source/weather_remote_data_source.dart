import 'package:injectable/injectable.dart';
import 'package:weatherapp/src/core/network/network_utils.dart';
import 'package:weatherapp/src/core/resources/app_url.dart';

import '../../model/weather_model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherForecastByCity(String cityName, String apiKey);
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  NetworkUtil networkUtil;
  WeatherRemoteDataSourceImpl(this.networkUtil);
  @override
  Future<WeatherModel> getWeatherForecastByCity(
      String cityName, String apiKey) async {
    try {
      final response = await networkUtil
          .get("${AppUrl.baseUrl}${AppUrl.forecast}?q=$cityName&appid=$apiKey&units=metric");
      if (response.statusCode == 200) {
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
        return weatherModel;
      } else {
        throw Exception("Server Exception");
      }
    } catch (e) {
      rethrow;
    }
  }
}
