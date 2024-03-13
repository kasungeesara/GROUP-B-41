import 'package:flutter/material.dart';
import 'package:travel_app/Data/hotels.dart';
import 'package:travel_app/Models/hotel.dart';
// ignore: unused_import
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/hotel/hotel_all.dart';
import 'package:travel_app/screens/hotel/hotel_details_screen.dart';
import 'package:travel_app/widgets/innerWidgets/exclusiveHotelCarousalCard.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({super.key});

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
                "Exclusive Hotels",
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
                      builder: (ctx) => const HotelScreen(),
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
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => HotelDetails(
                        hotel: hotels[index],
                      ),
                    ),
                  );
                },
                child: ExclusiveHotelCarousalCard(hotel: hotel),
              );
            },
          ),
        ),
      ],
    );
  }
}
