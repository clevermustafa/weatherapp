

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weatherapp/src/core/utils/toast_utils.dart';
import 'package:weatherapp/src/data/model/weather_model/list.dart';
import 'package:weatherapp/src/domain/usecase/get_weather_forecast_by_city_usecase.dart';

import '../../data/model/weather_model/weather_model.dart';

@lazySingleton
class WeatherProvider extends ChangeNotifier {
  WeatherStatus weatherStatus = WeatherStatus.initial;
  WeatherModel? weatherModel;
  List<List<ForecastList>>? eachDayForecastList;
  String? errorMessage;
  GetWeatherForecastByCityUsecase getWeatherForecastByCityUsecase;
  WeatherProvider(this.getWeatherForecastByCityUsecase);

  getWeatheForecastByCity(String cityName) async {
    weatherStatus = WeatherStatus.loading;
    notifyListeners();
    try {
      final data = await getWeatherForecastByCityUsecase.call(cityName);
      weatherModel = data;
      log("weatherModel!.list!.length ${weatherModel!.list!.length}");
      eachDayForecastList = forecastListOf5Days(weatherModel!.list!);
      weatherStatus = WeatherStatus.loaded;
      notifyListeners();
    } catch (e) {
      ToastUtils.showToast(e.toString(), ToastType.ERROR);
      weatherStatus = WeatherStatus.error;
      notifyListeners();
    }
  }
}

enum WeatherStatus {
  initial,
  loading,
  loaded,
  error,
}
