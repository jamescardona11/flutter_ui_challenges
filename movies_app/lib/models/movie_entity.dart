class MovieEntity {
  final int id;
  final String name;
  final String imageUrl;
  final List<int> genreIds;
  final String overview;
  final double? popularity;
  final String? releaseDate;
  final String language;
  final double rating;
  final String? status;
  final bool isFavorite;

  const MovieEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.genreIds = const [],
    required this.overview,
    this.popularity,
    this.releaseDate,
    required this.language,
    required this.rating,
    this.status,
    this.isFavorite = false,
  });

  String? get year => releaseDate?.split('-').firstOrNull.toString();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'genreIds': genreIds,
      'overview': overview,
      'popularity': popularity,
      'releaseDate': releaseDate,
      'language': language,
      'rating': rating,
      'status': status,
      'isFavorite': isFavorite,
    };
  }

  factory MovieEntity.fromMap(Map<String, dynamic> map) {
    return MovieEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      genreIds: List<int>.from((map['genreIds'] as List<int>)),
      overview: map['overview'] as String,
      popularity: map['popularity'] != null ? map['popularity'] as double : null,
      releaseDate: map['releaseDate'] != null ? map['releaseDate'] as String : null,
      language: map['language'] as String,
      rating: map['rating'] as double,
      status: map['status'] != null ? map['status'] as String : null,
      isFavorite: map['isFavorite'] as bool,
    );
  }
}
