import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/foundation.dart';

import '../models/natural.dart';

enum GalaxyStatus { initial, loading, loaded, error }

class GetGalaxyData extends ChangeNotifier {
  GalaxyStatus status = GalaxyStatus.initial;

  List<Natural> natural = [];

  GetGalaxyData() {
    _fetchNatural();
  }

  Future<void> _fetchNatural() async {
    status = GalaxyStatus.loading;
    try {
      // print(1);
      final data = await ApiService.getNaturalData(species: [
        "Galaxy"
      ]);
      // print(2);
      natural = data;
      status = GalaxyStatus.loaded;
    } catch (e) {
      status = GalaxyStatus.error;
    }
    notifyListeners();
  }
}
