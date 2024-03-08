// ignore: file_names
import 'package:flutter/material.dart';
import 'package:travel_app/Data/hotels.dart';
import 'package:travel_app/Models/hotel.dart';
import 'package:travel_app/screens/hotel/hotel_details_screen.dart';
// ignore: unused_import
import 'package:travel_app/widgets/destination_carousel.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exclusive Hotels",
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
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index) {
                Hotel topHotel = hotels[index];
                return GestureDetector(
                   onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HotelDetails(
                        hotel: hotels[index],
                      ),
                    ),
                  ),
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
                          padding:
                              const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
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
                                        topHotel.name,
                                        style: const TextStyle(
                                          fontSize: 20,
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
                                          "${topHotel.price}",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Outfit-Regular",
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Text(
                                          'Per night',
                                          style: TextStyle(
                                            fontFamily: "Outfit-Regular",
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(1.0),
                                  width: double.infinity,
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
                                        size: 10.0,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        topHotel.address.length > 22
                                            // ignore: prefer_interpolation_to_compose_strings
                                            ? topHotel.address.substring(0, 22) +
                                                "..."
                                            : topHotel.address,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
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
                            image: AssetImage(topHotel.imagePath),
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
