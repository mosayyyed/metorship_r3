class AnimeModel {
  final String title;
  final String category;
  final double rating;
  final String posterPath;

  const AnimeModel({
    required this.title,
    required this.category,
    required this.rating,
    required this.posterPath,
  });

  // Convert to domain entity
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'rating': rating,
      'posterPath': posterPath,
    };
  }

  // Create from map
  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
      title: map['title'] ?? '',
      category: map['category'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      posterPath: map['posterPath'] ?? '',
    );
  }
}
