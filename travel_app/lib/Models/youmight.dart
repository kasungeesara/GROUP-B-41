class YouMight {
  final String name;
  final String description;
  final String province;
  final String imagePath;
  final String about;

  YouMight({
    required this.name,
    this.description = '',
    required this.province,
    required this.imagePath,
    required this.about,
  });
}
