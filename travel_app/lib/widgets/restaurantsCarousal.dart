import 'package:flutter/material.dart';
import 'package:travel_app/Data/fine_dines.dart';
import 'package:travel_app/Models/fine_dine.dart';
import 'package:travel_app/screens/fine_dine/fine_dine_all.dart';
import 'package:travel_app/screens/fine_dine/fine_dine_details.dart';
import 'package:travel_app/widgets/innerWidgets/carousalCardReuseable1.dart';

class RestaurantCarousal extends StatelessWidget {
  const RestaurantCarousal({super.key});

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
                "Restaurants",
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
                            name: fineDines[index],
                          ),
                        ),
                      ),
                  child: CarousalCardReuseable1(
                    price: fineDineItem.price,
                    imagePath: fineDineItem.imagePath,
                    city: fineDineItem.city,
                    name: fineDineItem.name,
                  ));
            },
          ),
        ),
      ],
    );
  }
}
