class Destination {
  final String city;
  final int? activities;
  final String description;
  final String province;
  final String imagePath;

  Destination({
    required this.city,
    this.activities,
    this.description = '',
    required this.province,
    required this.imagePath,
  });
}
