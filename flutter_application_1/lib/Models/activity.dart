class Activity {
  final String baseCity;
  final String name;
  final String type;
  final double price;
  final String imagePath;
  final int rating;
  final String description;
  final List<String> startTimes;

  Activity({
    required this.baseCity,
    required this.name,
    required this.type,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.startTimes,
    this.description = '',
  });
}
