import 'package:flutter/material.dart';
import 'package:travel_app/Data/city_based_hotels.dart';
import 'package:travel_app/Models/city_based_hotels.dart';
import 'package:travel_app/Models/hotel_city.dart';
import 'package:travel_app/screens/city_hotel/ciyt_hotel_details.dart';

class HotelPlaceListScreen extends StatefulWidget {
  const HotelPlaceListScreen({super.key, required this.hotel});

  final CityHotel hotel;

  @override
  State<HotelPlaceListScreen> createState() => _HotelPlaceListScreenState();
}

class _HotelPlaceListScreenState extends State<HotelPlaceListScreen> {
  List<CityBasedHotel> availableHotels = [];

  @override
  Widget build(BuildContext context) {
    final filteredActivities = citybasedhotels
        .where((act) => act.baseCity.contains(widget.hotel.city))
        .toList();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.hotel.imagePath,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(widget.hotel.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                      iconSize: 30,
                      color: Colors.white,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.search_rounded),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.sort_rounded),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        widget.hotel.city,
                        style: const TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit-Regular",
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.compass_calibration_rounded,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            widget.hotel.province,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Outfit-Regular",
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 30,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: filteredActivities.length,
              itemBuilder: (BuildContext context, int index) {
                CityBasedHotel hotel = filteredActivities[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => CityHotelDetails(hotel: hotel),
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
                                    width: 120.0,
                                    child: Text(
                                      hotel.name,
                                      style: const TextStyle(
                                        fontSize: 17,
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
                                        '\$${hotel.price}',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Text(
                                        'per adult',
                                        style: TextStyle(
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 5),
                              
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: AssetImage(hotel.imagePath),
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
