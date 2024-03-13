import 'package:flutter/material.dart';
import 'package:travel_app/Models/coffee_cuisine.dart';

class CarousalCardReuseable2 extends StatelessWidget {
  const CarousalCardReuseable2({
    super.key,
    required this.placesCount,
    required this.description,
    required this.city,
    required this.imagePath,
    required this.province,
  });

  final int placesCount;
  final String description;
  final String imagePath;
  final String city;
  final String province;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Places: ${placesCount}",
                      style: const TextStyle(
                        fontFamily: "Outfit-Regular",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      description,
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
                  tag: imagePath,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: 180.0,
                      width: 220.0,
                      image: AssetImage(imagePath),
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
                          city,
                          style: const TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 255, 255, 255),
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
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              province,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Outfit-Regular",
                                color: Color.fromARGB(255, 255, 255, 255),
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
    );
  }
}
