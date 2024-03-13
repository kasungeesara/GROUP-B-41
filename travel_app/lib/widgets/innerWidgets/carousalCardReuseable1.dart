import 'package:flutter/material.dart';

class CarousalCardReuseable1 extends StatelessWidget {
  const CarousalCardReuseable1(
      {super.key,
      required this.price,
      required this.imagePath,
      required this.name,
      required this.city});

  final String price;
  final String imagePath;
  final String name;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      price,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: "Outfit-Regular",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "(Price Range)",
                      style: TextStyle(
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
                  tag: imagePath,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      height: 180.0,
                      width: 180.0,
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
                          name,
                          style: const TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 18,
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
                              city,
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
