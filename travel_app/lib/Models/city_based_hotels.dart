class CityBasedHotel {
  final String baseCity;
  final String name;
  final String city;
  final double price;
  final String imagePath;
  final String rating;
  final String description;
  final String address;
  final String tel;

  CityBasedHotel({
    required this.baseCity,
    required this.name,
    required this.city,
    required this.price,
    required this.imagePath,
    required this.rating,
    this.description = '',
    required this.address,
    required this.tel,
    
  });
}