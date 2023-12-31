import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/searchComponent/views/search_view.dart';
import 'package:flutter_state_management/weatherComponent/viewModel/weather_viewmodel.dart';
import 'package:flutter_state_management/weatherComponent/views/current_weather_view.dart';

class Navigation extends ConsumerWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text("Current Weather"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScaffold(),
              ),
            ),
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          const SafeArea(
            child: CurrentWeatherView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white.withOpacity(0.8),
        onPressed: () => ref
            .read(weatherViewModel)
            .fetchCurrentWeather(false, lat: 39.5696, long: 2.6502),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
