import 'package:discovery_app/models/world.dart';

class Travel extends World {
  Travel({required super.species, required super.entities});

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
      species: json["species"],
      entities: json["entities"].map((e) => Entity.fromJson(e)));
}
