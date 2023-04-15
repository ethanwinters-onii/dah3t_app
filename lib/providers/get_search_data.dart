import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/foundation.dart';

import '../models/natural.dart';

enum SearchSpecieStatus { initial, loading, loaded, error }

class GetSearchSpecieData extends ChangeNotifier {
  SearchSpecieStatus status = SearchSpecieStatus.initial;

  List<Natural> natural = [];

  GetSearchSpecieData({required String specie}) {
    _fetchNatural(specie: specie);
  }

  Future<void> _fetchNatural({required String specie}) async {
    status = SearchSpecieStatus.loading;
    try {
      print(1);
      final data = await ApiService.getNaturalData(species: [
        specie
      ]);
      print(2);
      natural = data;
      status = SearchSpecieStatus.loaded;
    } catch (e) {
      status = SearchSpecieStatus.error;
    }
    notifyListeners();
  }
}
