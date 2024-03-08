class CityHotel {
  final String city;
  final int? cityhotels;
  final String description;
  final String province;
  final String imagePath;

  CityHotel({
    required this.city,
    this.cityhotels,
    this.description = '',
    required this.province,
    required this.imagePath,
  });
}
