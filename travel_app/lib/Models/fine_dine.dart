class FineDine {
  final String name;
  final String range;
  final String description;
  final String city;
  final String imagePath;
  final String price;
  final String tel;
  final List<String> startTimes;
  final String address;
  final String url;

  FineDine({
    required this.name,
    required this.range,
    this.description = '',
    required this.city,
    required this.imagePath,
    required this.price,
    required this.tel,
    required this.startTimes,
    required this.address,
    required this.url,
  });
}
