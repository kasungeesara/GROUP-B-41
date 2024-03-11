class CoffeeCuisine {
  final String city;
  final int? places;
  final String description;
  final String province;
  final String imagePath;

  CoffeeCuisine({
    required this.city,
    this.places,
    this.description = '',
    required this.province,
    required this.imagePath,
  });
}
