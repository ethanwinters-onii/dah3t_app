import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/foundation.dart';

import '../models/natural.dart';

enum AnimalStatus { initial, loading, loaded, error }

class GetAnimalData extends ChangeNotifier {
  AnimalStatus status = AnimalStatus.initial;

  List<Natural> natural = [];

  GetAnimalData() {
    _fetchNatural();
  }

  Future<void> _fetchNatural() async {
    status = AnimalStatus.loading;
    try {
      print(1);
      final data = await ApiService.getNaturalData(species: [
        "Bird",
        "Landing Mammal",
        "Zodiac",
        "Insects",
        "Marsupials",
        "Reptiles"
      ]);
      print(2);
      natural = data;
      status = AnimalStatus.loaded;
    } catch (e) {
      status = AnimalStatus.error;
    }
    notifyListeners();
  }
}
