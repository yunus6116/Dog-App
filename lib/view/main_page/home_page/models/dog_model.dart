/// Dog model
class DogModel {
  final String? name;
  final String? imageUrl;

  DogModel({
    this.name,
    this.imageUrl,
  });

  DogModel copyWith({
    String? name,
    String? imageUrl,
  }) {
    return DogModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
