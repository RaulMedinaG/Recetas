class Receta {
  final int id;
  final String title;
  final String image;
  final String imageType;

  Receta({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  factory Receta.fromJson(Map<String, dynamic> json) => Receta(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
      );
}