import 'package:flutter/material.dart';
import 'package:travel_app/Data/heritage_places.dart';
import 'package:travel_app/Models/heritage_places.dart';

class HeritageScreen extends StatefulWidget {
  const HeritageScreen({super.key});

  @override
  State<HeritageScreen> createState() => _HeritageScreenState();
}

class _HeritageScreenState extends State<HeritageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding:  EdgeInsets.only(top: 15),
          child:  Text(
            "Discover Heritage Sites in\nSri Lanka",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit-Regular",
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: heritage.length,
              itemBuilder: (BuildContext context, int index) {
                Heritage heritageplace = heritage[index];
                return GestureDetector(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 40),
                                    child: SizedBox(
                                      width: 190,
                                      child: Text(
                                        heritageplace.place,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 40),
                                child: Container(
                                  padding: const EdgeInsets.all(1.0),
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        195, 14, 192, 106),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      const Icon(
                                        Icons.compass_calibration_rounded,
                                        size: 8.0,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        heritageplace.province,
                                        style: const TextStyle(
                                          fontSize: 12.4,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 40,
                                ),
                                child: Text(heritageplace.about,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: "Outfit-Regular",
                                    color: Color.fromARGB(255, 69, 69, 69),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 150,
                            height: 170,
                            image: AssetImage(heritageplace.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
