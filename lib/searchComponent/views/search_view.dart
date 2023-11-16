import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/searchComponent/viewModel/search_viewmodel.dart';
import 'package:flutter_state_management/weatherComponent/viewModel/weather_viewmodel.dart';

class SearchScaffold extends StatelessWidget {
  const SearchScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text("Search"),
        leading: const BackButton(),
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
          const SafeArea(child: SearchView()),
        ],
      ),
    );
  }
}

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: const InputDecoration(labelText: "Search"),
            onChanged: (changedString) =>
                ref.read(searchViewModel).searchLocation(changedString, false),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        Expanded(
          child: StreamBuilder(
            stream: ref.watch(searchViewModel).searchResponses,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final location = snapshot.data![index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.white),
                      ),
                      color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          "${location.name}, ${location.country}",
                        ),
                        onTap: () {
                          ref.read(weatherViewModel).fetchCurrentWeather(
                                false,
                                lat: location.lat,
                                long: location.lon,
                              );
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                final error = snapshot.error as Error;
                log(error.stackTrace.toString());
                return Center(
                  child: Text(
                    snapshot.error!.toString(),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    "Enter a Query to start!",
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
