import 'package:flutter/material.dart';
import 'package:travel_app/Data/coffee_cuisine.dart';
import 'package:travel_app/Models/coffee_cuisine.dart';
import 'package:travel_app/screens/coffeecuisine/coffeecuisine_all.dart';
import 'package:travel_app/screens/coffeecuisine/coffeecuisine_list.dart';
import 'package:travel_app/widgets/innerWidgets/carousalCardReuseable2.dart';

class CoffeeCuisineCarousel extends StatelessWidget {
  const CoffeeCuisineCarousel({super.key});

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
                "Coffee & Cuisine",
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
                      builder: (ctx) => const CoffeeCuisineAll(),
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
              CoffeeCuisine coffeecuisines = coffeecuisine[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) =>
                          CoffeeCuisinetList(city: coffeecuisines),
                    ),
                  );
                },
                child: CarousalCardReuseable2(
                  placesCount: coffeecuisines.places,
                  description: coffeecuisines.description,
                  city: coffeecuisines.city,
                  imagePath: coffeecuisines.imagePath,
                  province: coffeecuisines.province,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
