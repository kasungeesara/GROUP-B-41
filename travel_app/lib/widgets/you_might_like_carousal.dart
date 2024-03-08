import 'package:flutter/material.dart';
import 'package:travel_app/Data/you-might_like.dart';
import 'package:travel_app/Models/youmight.dart';
import 'package:travel_app/screens/you_might_like_screen.dart';

class YouMightCarousel extends StatelessWidget {
  const YouMightCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "You might like these ",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  letterSpacing: 1.2,
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
              YouMight youmightlike = youmight[index];

              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => YouMightDetails(
                      youMight: youmightlike,
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
                                  youmightlike.description,
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
                              tag: youmightlike.imagePath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(youmightlike.imagePath),
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
                                      youmightlike.name,
                                      style: const TextStyle(
                                        letterSpacing: 1.2,
                                        fontSize: 24,
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
                                          youmightlike.province,
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
