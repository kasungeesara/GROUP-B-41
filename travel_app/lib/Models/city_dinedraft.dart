class CityDineDraft {
  final String baseCity;
  final String name;
  final String city;
  final String price;
  final String imagePath;
  final int rating;
  final String description;
  final String address;
  final double tel;
  final List<String> startTimes;

  CityDineDraft({
    required this.baseCity,
    required this.name,
    required this.city,
    required this.price,
    required this.imagePath,
    required this.rating,
    this.description = '',
    required this.address,
    required this.tel,
    required this.startTimes,
    
  });
}