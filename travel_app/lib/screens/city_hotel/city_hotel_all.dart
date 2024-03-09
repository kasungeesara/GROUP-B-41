import 'package:flutter/material.dart';
import 'package:travel_app/Data/city_hotel.dart';
import 'package:travel_app/Models/hotel_city.dart';
import 'package:travel_app/screens/hotel_place_list.dart';
// ignore: unused_import
import 'package:travel_app/widgets/destination_carousel.dart';

class CityHotelAllScreen extends StatefulWidget {
  const CityHotelAllScreen({super.key});

  @override
  State<CityHotelAllScreen> createState() => _CityHotelAllScreenState();
}

class _CityHotelAllScreenState extends State<CityHotelAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hotels and Places to stay",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Outfit-Regular",
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: cityhotels.length,
              itemBuilder: (BuildContext context, int index) {
                CityHotel cityHotel = cityhotels[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>
                            HotelPlaceListScreen(hotel: cityHotel),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
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
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        cityHotel.city,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "${cityHotel.cityhotels}",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Outfit-Regular",
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Text(
                                          'Hotels',
                                          style: TextStyle(
                                            fontFamily: "Outfit-Regular",
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(1.0),
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(195, 14, 192, 106),
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
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        cityHotel.province,
                                        style: const TextStyle(
                                          fontSize: 12.4,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  cityHotel.description,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Outfit-Regular",
                                    color: Color.fromARGB(255, 134, 134, 134),
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
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
                            width: 110.0,
                            image: AssetImage(cityHotel.imagePath),
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
