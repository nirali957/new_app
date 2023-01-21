class ListMapModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OriginAndLocationModel? origin;
  final OriginAndLocationModel? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  ListMapModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory ListMapModel.fromJson(Map<String, dynamic> json) {
    return ListMapModel(
      id: json['id'],

      ///
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: OriginAndLocationModel.fromJson(json['origin']),
      location: OriginAndLocationModel.fromJson(json['location']),
      image: json['image'],
      episode: json['episode'],
      url: json['url'],
      created: json['created'],
    );
  }
}

class OriginAndLocationModel {
  final String? name;
  final String? url;

  OriginAndLocationModel({this.name, this.url});

  factory OriginAndLocationModel.fromJson(Map<String, dynamic> json) {
    return OriginAndLocationModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
