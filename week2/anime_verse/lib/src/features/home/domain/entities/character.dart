class Character {
  final String name;
  final String animeName;
  final String imagePath;

  const Character({
    required this.name,
    required this.animeName,
    required this.imagePath,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.name == name &&
        other.animeName == animeName &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode => name.hashCode ^ animeName.hashCode ^ imagePath.hashCode;
}
