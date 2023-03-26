import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/toast_utils.dart';
import '../../../feature/weather_provider.dart';

class WeatherSearchButton extends StatelessWidget {
  const WeatherSearchButton({
    super.key,
    required this.searchWeatherByCityController,
  });

  final TextEditingController searchWeatherByCityController;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(100, 40))
      ),
      onPressed: () {
        if (searchWeatherByCityController.text.isEmpty) {
          ToastUtils.showToast(
              "City name field is empty", ToastType.ERROR);
        } else if (searchWeatherByCityController.text.length <
            4) {
          ToastUtils.showToast(
              "City name must not be less than 4 characters",
              ToastType.ERROR);
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
          Provider.of<WeatherProvider>(context, listen: false)
              .getWeatheForecastByCity(
                  searchWeatherByCityController.text);
          searchWeatherByCityController.clear();

        }
      },
      child: const Text("Search"),
    );
  }
}