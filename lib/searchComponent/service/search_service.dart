import 'dart:convert';
import 'dart:developer';

import 'package:flutter_state_management/searchComponent/model/search_response.dart';
import 'package:http/http.dart' as http;

class SearchService {
  static Future<List<SearchResponse>> fetchSearch(
    String searchString,
    bool forceRefresh,
  ) async {
    final client = http.Client();
    final url = Uri.https(
      "api.openweathermap.org",
      "geo/1.0/direct",
      {
        "q": searchString,
        "limit": "5",
        "appid": const String.fromEnvironment("OpenWeatherAPI"),
      },
    );
    final response = await client.get(url);
    log("${response.statusCode} ${url.toString()}");
    final json = jsonDecode(response.body);
    if (json == null) {
      return [];
    } else if (json is Map<String, dynamic>) {
      return [SearchResponse.fromJson(json)];
    } else {
      final jsonList = json as List<dynamic>;
      return jsonList.map((e) => SearchResponse.fromJson(e)).toList();
    }
  }
}
