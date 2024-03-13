import 'package:flutter/material.dart';
import 'package:travel_app/Data/pubs.dart';
import 'package:travel_app/Models/pub.dart';
import 'package:travel_app/screens/pub/pub_all.dart';
import 'package:travel_app/screens/pub/pub_details.dart';
import 'package:travel_app/widgets/innerWidgets/carousalCardReuseable1.dart';

class PubCarousel extends StatelessWidget {
  const PubCarousel({super.key});

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
                "Pubs",
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
                      builder: (ctx) => const PubAll(),
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
              Pubs pub2 = pubs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PubDetails(
                        pubs: pubs[index],
                      ),
                    ),
                  );
                },
                child: CarousalCardReuseable1(
                    price: pub2.price,
                    imagePath: pub2.imagePath,
                    name: pub2.name,
                    city: pub2.city),
              );
            },
          ),
        ),
      ],
    );
  }
}
