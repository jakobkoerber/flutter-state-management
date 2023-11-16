import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/searchComponent/model/search_response.dart';
import 'package:flutter_state_management/searchComponent/service/search_service.dart';
import 'package:rxdart/rxdart.dart';

final searchViewModel = Provider((ref) => SearchViewModel());

class SearchViewModel {
  BehaviorSubject<List<SearchResponse>?> searchResponses =
      BehaviorSubject.seeded(null);

  Future searchLocation(String searchString, bool forceRefresh) async {
    return SearchService.fetchSearch(searchString, forceRefresh).then(
      (value) => searchResponses.add(value),
      onError: (error) => searchResponses.addError(error),
    );
  }
}
