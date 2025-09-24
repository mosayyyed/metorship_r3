class CharacterModel {
  final String name;
  final String animeName;
  final String imagePath;

  const CharacterModel({
    required this.name,
    required this.animeName,
    required this.imagePath,
  });

  // Convert to map
  Map<String, dynamic> toMap() {
    return {'name': name, 'animeName': animeName, 'imagePath': imagePath};
  }

  // Create from map
  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      name: map['name'] ?? '',
      animeName: map['animeName'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}
