import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_management/newsComponent/model/current_weather.dart';
import 'package:flutter_state_management/newsComponent/viewModel/weather_viewmodel.dart';

class CurrentWeatherView extends ConsumerStatefulWidget {
  const CurrentWeatherView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CurrentWeatherViewState();
}

class _CurrentWeatherViewState extends ConsumerState<CurrentWeatherView> {
  @override
  void initState() {
    ref.read(weatherViewModel).fetchCurrentWeather(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(weatherViewModel).currentWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _currentWeatherOverView(snapshot.data!, context);
        } else if (snapshot.hasError) {
          log((snapshot.error as Error).stackTrace.toString());
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const Center(
            child: Column(
              children: [
                CircularProgressIndicator.adaptive(),
                Text("Loading Current Weather"),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _currentWeatherOverView(
    CurrentWeather currentWeather,
    BuildContext context,
  ) {
    return Column(
      children: [
        Text(
          currentWeather.name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "${currentWeather.main.temp.toString()} °C",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "Feels like: ${currentWeather.main.feelsLike.toString()} °C",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            _infoItem(
              Icons.arrow_downward,
              currentWeather.main.tempMin.toString(),
              "°C",
              context,
            ),
            _infoItem(
              Icons.arrow_upward,
              currentWeather.main.tempMax.toString(),
              "°C",
              context,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        Row(
          children: [
            _infoItem(
              Icons.foggy,
              currentWeather.main.humidity.toString(),
              "%",
              context,
            ),
            _infoItem(
              Icons.umbrella,
              currentWeather.rain?.the1H.toString() ?? "0",
              "mm",
              context,
            ),
          ],
        ),
      ],
    );
  }

  Widget _infoItem(
      IconData icon, String data, String unit, BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
          Text(
            "$data $unit",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
