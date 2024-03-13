import 'package:flutter/material.dart';
import 'package:travel_app/Data/dine_draft.dart';
import 'package:travel_app/Models/dine_draft.dart';
import 'package:travel_app/screens/dinedraft/dinedraft_all.dart';
import 'package:travel_app/screens/dinedraft/dinedraft_list.dart';
import 'package:travel_app/widgets/innerWidgets/carousalCardReuseable2.dart';

class EatCityCarousel extends StatelessWidget {
  const EatCityCarousel({super.key});

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
                "Dine & Draft",
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
                      builder: (ctx) => const DineDraftAll(),
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
              DineDraft dinedrafts = dinedraft[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => DineDraftList(city: dinedrafts),
                    ),
                  );
                },
                child: CarousalCardReuseable2(placesCount: dinedrafts.places, description: dinedrafts.description, city: dinedrafts.city, imagePath: dinedrafts.imagePath, province: dinedrafts.province),
              );
            },
          ),
        ),
      ],
    );
  }
}
