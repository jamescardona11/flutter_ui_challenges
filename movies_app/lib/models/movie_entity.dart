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

  static MovieEntity fromJson(Map<String, dynamic> json) => MovieEntity(
        id: (json['id'] as num).toInt(),
        name: json['original_title'] as String,
        imageUrl: json['poster_path'] as String,
        genreIds: (json['genres'] as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ?? const [],
        overview: json['overview'] as String,
        releaseDate: json['release_date'] as String?,
        language: json['original_language'] as String,
        rating: (json['vote_average'] as num).toDouble(),
        status: json['status'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        isFavorite: json['isFavorite'] as bool? ?? false,
      );
}
