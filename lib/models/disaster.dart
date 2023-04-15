import 'package:discovery_app/models/world.dart';

class NaturalDisaster extends World {
  NaturalDisaster({required super.species, required super.entities});

  factory NaturalDisaster.fromJson(Map<String, dynamic> json) => NaturalDisaster(
      species: json["species"],
      entities: json["entities"].map((e) => Entity.fromJson(e)));
}
