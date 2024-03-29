import 'package:flutter/material.dart';
import 'package:travel_app/Data/city_hotel.dart';
import 'package:travel_app/Models/hotel_city.dart';
import 'package:travel_app/screens/city_hotel/city_hotel_all.dart';
import 'package:travel_app/screens/hotel_place_list.dart';
import 'package:travel_app/widgets/innerWidgets/hotelsAndWidgetsCarousalCard.dart';

class HotelCityCarousel extends StatelessWidget {
  const HotelCityCarousel({super.key});
  

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
                "Hotels and Places to \nstay",
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
                      builder: (ctx) => const CityHotelAllScreen(),
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
              CityHotel cityhotel = cityhotels[index];

              return GestureDetector(
                 onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>
                            HotelPlaceListScreen(hotel: cityhotel),
                      ),
                    );
                  },
                child: HotelsAndPlacesCarousalCard(cityhotel: cityhotel)
              );
            },
          ),
        ),
      ],
    );
  }
}
