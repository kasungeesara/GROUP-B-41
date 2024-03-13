import 'package:flutter/material.dart';
import 'package:travel_app/Data/bestCafes.dart';
import 'package:travel_app/Models/cafe.dart';
import 'package:travel_app/screens/cafe/bestcafe_all.dart';
import 'package:travel_app/screens/cafe/cafe_details.dart';
import 'package:travel_app/widgets/innerWidgets/carousalCardReuseable1.dart';

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
              BestCafe bestcafes = bestCafes[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CafeDetails(
                      bestcafe: bestCafes[index],
                    ),
                  ),
                ),
                child: CarousalCardReuseable1(
                  price: bestcafes.price,
                  imagePath: bestcafes.imagePath,
                  name: bestcafes.name,
                  city: bestcafes.city,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
