import 'package:flutter/material.dart';
import 'package:travel_app/screens/cafe/bestcafe_all.dart';
import 'package:travel_app/screens/cafe/cafe_details.dart';

class BestCafe {
  final String name;
  final String range;
  final String description;
  final String city;
  final String imagePath;
  final String price;

  BestCafe({
    required this.name,
    required this.range,
    this.description = '',
    required this.city,
    required this.imagePath,
    required this.price,
  });
}

final List<BestCafe> bestCafes = [
  BestCafe(
    name: 'Cafe Kumbuk',
    city: 'Colombo',
    range: "Price Range",
    description: 'Cafe, Healthy',
    imagePath: "assets/cafe11.png",
    price: "\$2-\$3",
  ),
  BestCafe(
    name: "The t-Lounge",
    city: 'Colombo',
    range: "Price Range",
    description: 'Cafe, Sri Lankan',
    imagePath: "assets/cafe2.jpg",
    price: "\$2-\$3",
  ),
  BestCafe(
    name: 'Seed Cafe',
    city: 'Colombo',
    range: "Price Range",
    description: 'Cafe',
    imagePath: "assets/cafe3.jpg",
    price: "\$2-\$3",
  ),
  BestCafe(
    name: 'Secret Alley',
    city: 'Kandy',
    range: "Price Range",
    description: 'Cafe',
    imagePath: "assets/cafe4.jpg",
    price: "\$2-\$3",
  ),
  BestCafe(
    name: 'Cafe Nuwara',
    city: 'Kandy',
    range: "Price Range",
    description: 'Cafe',
    imagePath: "assets/cafe5.jpg",
    price: "\$2-\$3",
  ),
];

class BestCafeCarousel extends StatelessWidget {
  const BestCafeCarousel({super.key});

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
                "Cafés",
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
                      builder: (ctx) => const CafeAll(),
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
            itemCount: bestCafes.length,
            itemBuilder: (BuildContext context, int index) {
              BestCafe bestcafe = bestCafes[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CafeDetails(
                      bestcafe: bestCafes[index],
                    ),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 210,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 35.0,
                        child: Container(
                          height: 120,
                          width: 200,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  bestcafe.range,
                                  style: const TextStyle(
                                    fontFamily: "Outfit-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  bestcafe.price,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    letterSpacing: 1.2,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Outfit-Regular",
                                    color: Color.fromARGB(255, 145, 145, 145),
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
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: bestcafe.imagePath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(bestcafe.imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 8.0,
                              bottom: 1.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                      bestcafe.name,
                                      style: const TextStyle(
                                        letterSpacing: 1.2,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Outfit-Regular",
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Row(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.compass_calibration_rounded,
                                          size: 10.0,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          bestcafe.city,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Outfit-Regular",
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
