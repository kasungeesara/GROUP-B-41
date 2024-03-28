import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/map.dart';
import 'package:travel_app/screens/profile.dart';
import 'package:travel_app/widgets/coffee_cuisine_carousal.dart';
import 'package:travel_app/widgets/cafe_carousal.dart';
import 'package:travel_app/widgets/coffe_carousal.dart';
import 'package:travel_app/widgets/destination_carousel.dart';
import 'package:travel_app/widgets/dine_draft_carousal.dart';
import 'package:travel_app/widgets/restaurantsCarousal.dart';
import 'package:travel_app/widgets/homeBanner_3.dart';
import 'package:travel_app/widgets/homeBanner_1.dart';
import 'package:travel_app/widgets/homeBanner_2.dart';
import 'package:travel_app/widgets/hotel_based_on_city_carousal.dart';
import 'package:travel_app/widgets/hotels_carousel.dart';
import 'package:travel_app/widgets/pub_carousal.dart';
import 'package:travel_app/widgets/you_might_like_carousal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  Widget? currentContent;
  var firstName = "";

  var _isGetUserData = false;

  void getuserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get();

    if (!_isGetUserData) {
      setState(() {
        firstName = userData.data()!["first-name"];
      });
      _isGetUserData = true;
    }
  }

  final List<IconData> _icons = [
    Icons.directions_car,
    Icons.hotel,
    Icons.restaurant,
    Icons.fastfood,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromARGB(195, 14, 192, 106)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 255, 255, 255)
              : const Color.fromARGB(255, 108, 108, 108),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getuserData();
    if (_currentTab == 0) {
      currentContent = ListView(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello ${firstName}!",
                  style: TextStyle(
                    color: const Color.fromARGB(195, 14, 192, 106),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit-Regular",
                  ),
                ),
                Text(
                  "What would you like to find?",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit-Regular",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons
                .asMap()
                .entries
                .map(
                  (MapEntry<int, IconData> entry) => _buildIcon(entry.key),
                )
                .toList(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          if (_selectedIndex == 0) const DestinationCarousel(),
          if (_selectedIndex == 1) const HotelCarousel(),
          if (_selectedIndex == 2) const RestaurantCarousal(),
          if (_selectedIndex == 3) const BestCafeCarousel(),
          const SizedBox(
            height: 8.0,
          ),
          if (_selectedIndex == 1) const HotelCityCarousel(),
          if (_selectedIndex == 2) const PubCarousel(),
          if (_selectedIndex == 3) const CoffeeCarousel(),
          const SizedBox(
            height: 8.0,
          ),
          if (_selectedIndex == 0) const HomeBanner1(),
          if (_selectedIndex == 2) const EatCityCarousel(),
          if (_selectedIndex == 3) const CoffeeCuisineCarousel(),
          const SizedBox(
            height: 25,
          ),
          if (_selectedIndex == 0) const YouMightCarousel(),
          if (_selectedIndex == 0) const HomeBanner2(),
          if (_selectedIndex == 1) const HomeBanner3(),
        ],
      );
    } else if (_currentTab == 1) {
      currentContent = const MapScreen();
    } else if (_currentTab == 2) {
      currentContent = const ProfileScreen();
    }

    return Scaffold(
      body: SafeArea(child: currentContent!),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentTab,
          selectedItemColor: const Color.fromARGB(195, 14, 192, 106),
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
                size: 30,
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
