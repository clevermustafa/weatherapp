import 'package:injectable/injectable.dart';
import 'package:weatherapp/src/core/use_cases/use_cases.dart';
import 'package:weatherapp/src/data/model/weather_model/weather_model.dart';
import 'package:weatherapp/src/domain/repository/weather_repository.dart';

abstract class GetWeatherForecastByCityUsecase extends UseCases<WeatherModel, String> {}
@LazySingleton(as: GetWeatherForecastByCityUsecase)
class GetWeatherForecastByCityUsecaseImpl implements GetWeatherForecastByCityUsecase {
  WeatherRepository weatherRepository;
  GetWeatherForecastByCityUsecaseImpl(this.weatherRepository);
  @override
  Future<WeatherModel> call(String params) async {
    return await weatherRepository.getWeatherForecastByCity(params);
  }
}