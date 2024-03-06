import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/fine_dine_all.dart';
import 'package:flutter_application_1/screens/fine_dine_details.dart';

class FineDine {
  final String name;
  final String range;
  final String description;
  final String city;
  final String imagePath;
  final String price;

  FineDine({
    required this.name,
    required this.range,
    this.description = '',
    required this.city,
    required this.imagePath,
    required this.price,
  });
}

final List<FineDine> fineDines = [
  FineDine(
    name: 'The Avenue',
    city: 'Colombo',
    range: "Price Range",
    description: 'Food',
    imagePath: "assets/fid1.jpg",
    price: "\$7-\$25",
  ),
  FineDine(
    name: 'Rare at Residence',
    city: 'Colombo',
    range: "Price Range",
    description: 'Food',
    imagePath: "assets/fid2.jpg",
    price: "\$8-\$30",
  ),
  FineDine(
    name: 'Shang Palace',
    city: 'Colombo',
    range: "Price Range",
    description: 'Food',
    imagePath: "assets/fid3.jpg",
    price: "\$10-\$50",
  ),
  FineDine(
    name: 'Theva Cuisine',
    city: 'Kandy',
    range: "Price Range",
    description: 'Food',
    imagePath: "assets/fid4.jpg",
    price: "\$7-\$50",
  ),
  FineDine(
    name: 'Senani by Oak Ray',
    city: 'Kandy',
    range: "Price Range",
    description: 'Food',
    imagePath: "assets/fid5.jpg",
    price: "\$5-\$20",
  ),
];

class FineDineCarousel extends StatelessWidget {
  const FineDineCarousel({super.key});

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
                "Fine Dine",
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
                      builder: (ctx) => const FineDineAll(),
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
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              FineDine fineDineItem = fineDines[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FineDineDetails(
                      fineDine: fineDines[index],
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
                                  fineDineItem.range,
                                  style: const TextStyle(
                                    fontFamily: "Outfit-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  fineDineItem.price,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    letterSpacing: 1.2,
                                    fontSize: 12,
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
                              tag: fineDineItem.imagePath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(fineDineItem.imagePath),
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
                                      fineDineItem.name,
                                      style: const TextStyle(
                                        letterSpacing: 1.2,
                                        fontSize: 18,
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
                                          fineDineItem.city,
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
