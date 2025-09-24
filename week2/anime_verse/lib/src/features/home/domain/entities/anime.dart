class Anime {
  final String title;
  final String category;
  final double rating;
  final String posterPath;

  const Anime({
    required this.title,
    required this.category,
    required this.rating,
    required this.posterPath,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Anime &&
        other.title == title &&
        other.category == category &&
        other.rating == rating &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        category.hashCode ^
        rating.hashCode ^
        posterPath.hashCode;
  }
}
