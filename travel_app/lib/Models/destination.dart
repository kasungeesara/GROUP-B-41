class Destination {
  final String city;
  final int? activities;
  final String description;
  final String province;
  final String imagePath;
  final int? hotels;

  Destination({
    required this.city,
    this.activities,
    this.description = '',
    required this.province,
    this.hotels,
    required this.imagePath,
  });
}
