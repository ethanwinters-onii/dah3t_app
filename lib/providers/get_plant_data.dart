import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/foundation.dart';

import '../models/natural.dart';

enum PlantStatus { initial, loading, loaded, error }

class GetPlantData extends ChangeNotifier {
  PlantStatus status = PlantStatus.initial;

  List<Natural> natural = [];

  GetPlantData() {
    _fetchNatural();
  }

  Future<void> _fetchNatural() async {
    status = PlantStatus.loading;
    try {
      // print(1);
      final data = await ApiService.getNaturalData(species: [
        "Cây công nghiệp",
        "Cây nông nghiệp",
        "Hoa",
      ]);
      // print(2);
      natural = data;
      status = PlantStatus.loaded;
    } catch (e) {
      status = PlantStatus.error;
    }
    notifyListeners();
  }
}
