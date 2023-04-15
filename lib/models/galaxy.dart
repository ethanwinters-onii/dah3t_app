import 'package:discovery_app/models/world.dart';

class Galaxy extends World {
  Galaxy({required super.species, required super.entities});

  factory Galaxy.fromJson(Map<String, dynamic> json) => Galaxy(
      species: json["species"],
      entities: json["entities"].map((e) => Entity.fromJson(e)));
}
