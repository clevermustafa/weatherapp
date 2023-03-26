import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/src/core/utils/toast_utils.dart';
import 'package:weatherapp/src/data/model/weather_model/list.dart';
import 'package:weatherapp/src/presentation/feature/weather_provider.dart';
import 'package:weatherapp/src/presentation/pages/weather_page/widgets/weather_detail_widget.dart';
import 'package:weatherapp/src/presentation/pages/weather_page/widgets/weather_empty.dart';
import 'package:weatherapp/src/presentation/pages/weather_page/widgets/weather_loading.dart';
import 'package:weatherapp/src/presentation/pages/weather_page/widgets/weather_search_button.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController searchWeatherByCityController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade200,
              Colors.blue.shade50,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: searchWeatherByCityController,
                      decoration: const InputDecoration(
                        hintText: "Search forecast detail by city name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Expanded(
                      child: Provider.of<WeatherProvider>(context)
                                  .weatherModel ==
                              null
                          ? const WeatherEmpty()
                          : SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Text(
                                      Provider.of<WeatherProvider>(context)
                                              .weatherModel
                                              ?.city
                                              ?.name ??
                                          "",
                                      style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Provider.of<WeatherProvider>(context)
                                                .weatherModel
                                                ?.list?[0]
                                                .main
                                                ?.temp
                                                .toString() ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "°C",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  for (List<ForecastList> fl
                                      in Provider.of<WeatherProvider>(context)
                                          .eachDayForecastList!)
                                    WeatherDetailWidget(forecastList: fl),
                                  const SizedBox(height: 20,)
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: WeatherSearchButton(
                      searchWeatherByCityController:
                          searchWeatherByCityController),
                ),
                Provider.of<WeatherProvider>(context).weatherStatus ==
                        WeatherStatus.loading
                    ? const WeatherLoading()
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
