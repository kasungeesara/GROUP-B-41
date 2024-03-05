import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/hotel_details_screen.dart';
import 'package:flutter_application_1/screens/hotel_screen.dart';

class Hotel {
  final String name;
  final String address;
  final double price;
  final String imagePath;
  final String type;
  final String tel;

  Hotel({
    required this.name,
    required this.address,
    required this.price,
    required this.imagePath,
    required this.type,
    required this.tel,
  });
}

final List<Hotel> hotels = [
  Hotel(
    name: 'Wild Coast Tented Lodge',
    address: 'Wild Coast Tented Lodge Palatupana, Yala.',
    price: 1245,
    imagePath: "assets/h11.jpg",
    type: "5-star hotel",
    tel: "0117 745 730",
  ),
  Hotel(
    name: 'Le Grand Galle',
    address: 'Hilltop Buiding, 30 Park Rd, Galle.',
    price: 223,
    imagePath: "assets/h2.jpg",
    type: "5-star hotel",
    tel: "0912 228 555",
  ),
  Hotel(
    name: 'Shangri-La Hambantota',
    address: 'Sittrakala Watta, Chithragala, Ambalantota.',
    price: 230,
    imagePath: "assets/h3.jpg",
    type: "5-star hotel",
    tel: "0477 888 888",
  ),
  Hotel(
    name: 'Jetwing Lake',
    address: 'Wijaya Kumaratunga Mawatha Yapagama, Dambulla',
    price: 125,
    imagePath: "assets/h4.jpg",
    type: "5-star hotel",
    tel: "0662 040 700",
  ),
  Hotel(
    name: 'The Golden Ridge Hotel',
    address: '395, Road, Nuwaraeliya 22200',
    price: 145,
    imagePath: "assets/h5.jpg",
    type: "5-star hotel",
    tel: "0522 030 300",
  ),
  Hotel(
    name: 'Jetwing Blue',
    address: '6RRR+MPF, Porutota Rd, Negombo 11500',
    price: 140,
    imagePath: "assets/h6.jpg",
    type: "5-star hotel",
    tel: "0312 279 000",
  ),
  Hotel(
    name: 'Jetwing Surf',
    address: 'P20, Kottukal Road, Hidayapuram, Pottuvil 32500',
    price: 148,
    imagePath: "assets/h7.jpg",
    type: "5-star hotel",
    tel: "0632 030 300",
  ),
  Hotel(
    name: 'Taj Bentota Resort & Spa',
    address: 'National Holiday Resort, Galle, Bentota 80500',
    price: 218,
    imagePath: "assets/h8.jpg",
    type: "5-star hotel",
    tel: "0345 555 555",
  ),
  Hotel(
    name: 'Heritance Ahungalla',
    address: 'Galle Rd, Ahungalla',
    price: 175,
    imagePath: "assets/h9.jpg",
    type: "5-star hotel",
    tel: "0915 555 000",
  ),
  Hotel(
    name: 'Wattura Resort and Spa',
    address: '1271 Kammala South Road, Waikkal 61110',
    price: 265,
    imagePath: "assets/h10.jpg",
    type: "5-star hotel",
    tel: "0317 857 857",
  ),
];

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Exclusive Hotels",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const HotelScreen(),
                    ),
                  );
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit-Regular",
                    letterSpacing: 1.0,
                    color: Color.fromARGB(195, 14, 192, 106),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HotelDetails(
                      hotel: hotels[index],
                    ),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 240,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120,
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  hotel.name,
                                  style: const TextStyle(
                                    fontFamily: "Outfit-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  hotel.address,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    letterSpacing: 1.2,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Outfit-Regular",
                                    color: Color.fromARGB(255, 85, 85, 85),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  '\$${hotel.price.toStringAsFixed(2)}/night',
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            height: 180.0,
                            width: 220.0,
                            image: AssetImage(hotel.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
