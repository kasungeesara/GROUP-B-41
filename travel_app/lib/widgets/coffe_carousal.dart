import 'package:flutter/material.dart';
import 'package:travel_app/Data/coffies.dart';
import 'package:travel_app/Models/coffe.dart';
import 'package:travel_app/screens/coffe/coffe_all.dart';
import 'package:travel_app/screens/coffe/coffee_details.dart';
import 'package:travel_app/widgets/innerWidgets/carousalCardReuseable1.dart';

class CoffeeCarousel extends StatelessWidget {
  const CoffeeCarousel({super.key});

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
                "Coffee Shops",
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
                      builder: (ctx) => const CoffeeAll(),
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
              Coffee topCoffee = coffeetea[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CoffeeDetails(
                        coffee: coffeetea[index],
                      ),
                    ),
                  );
                },
                child: CarousalCardReuseable1(
                  price: topCoffee.price,
                  imagePath: topCoffee.imagePath,
                  name: topCoffee.name,
                  city: topCoffee.city,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
