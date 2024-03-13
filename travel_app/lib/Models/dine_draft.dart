class DineDraft {
  final String city;
  final int places;
  final String description;
  final String province;
  final String imagePath;

  DineDraft({
    required this.city,
    this.places=0,
    this.description = '',
    required this.province,
    required this.imagePath,
  });
}
