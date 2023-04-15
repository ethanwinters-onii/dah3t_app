import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/foundation.dart';

import '../models/natural.dart';

enum DisasterStatus { initial, loading, loaded, error }

class GetDisasterData extends ChangeNotifier {
  DisasterStatus status = DisasterStatus.initial;

  List<Natural> natural = [];

  GetDisasterData() {
    _fetchNatural();
  }

  Future<void> _fetchNatural() async {
    status = DisasterStatus.loading;
    try {
      // print(1);
      final data = await ApiService.getNaturalData(species: [
        'Natural Disaster'
      ]);
      // print(2);
      natural = data;
      status = DisasterStatus.loaded;
    } catch (e) {
      status = DisasterStatus.error;
    }
    notifyListeners();
  }
}
