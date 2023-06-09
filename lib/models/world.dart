abstract class World {
  final String species;
  final List<Entity> entities;

  World({required this.species, required this.entities});
}

class Entity {
  final String name, avatar, description, linkWiki;
  final List<String> images;

  Entity(
      {required this.name,
      required this.avatar,
      required this.images,
      required this.description,
      required this.linkWiki});

  static String convertUrl(String url) {
    if (url.split('/').last == "view") {
      final idx = url.split('/');
      final id = idx[idx.length - 2];
      return "https://drive.google.com/uc?export=view&id=$id";
    } else {
      if (url.split('=').last == "share_link") {
        final idx = url.split('/');
        final id = idx[idx.length - 2];
        return "https://drive.google.com/uc?export=view&id=$id";
      } else {
        final id = url.split('?')[1].split('&')[0];
        return "https://drive.google.com/uc?export=view&$id";
      }
    }
  }

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
      name: json["name"] ?? "",
      avatar: convertUrl(json["avatar"].toString()),
      images: json["images"]
              .map<String>((e) => convertUrl(e["imageLink"].toString()))
              .toList() ??
          [],
      description: json["description"],
      linkWiki: json["linkWiki"]);
}
