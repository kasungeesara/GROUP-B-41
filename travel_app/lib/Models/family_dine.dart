class FamilyDine {
  final String name;
  final String range;
  final String description;
  final String city;
  final String imagePath;
  final String price;

  FamilyDine({
    required this.name,
    required this.range,
    this.description = '',
    required this.city,
    required this.imagePath,
    required this.price,
  });
}