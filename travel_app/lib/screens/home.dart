import 'package:flutter/material.dart';
import 'package:travel_app/widgets/bar_carousal.dart';
import 'package:travel_app/widgets/cafe_carousal.dart';
import 'package:travel_app/widgets/coffe_carousal.dart';
import 'package:travel_app/widgets/destination_carousel.dart';
import 'package:travel_app/widgets/family_dining_carosal.dart';
import 'package:travel_app/widgets/fine_dining_carousel.dart';
import 'package:travel_app/widgets/hotels_carousel.dart';
import 'package:travel_app/widgets/pub_carousal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  final List<IconData> _icons = [
    Icons.directions_car,
    Icons.restaurant,
    Icons.fastfood,
    Icons.liquor,
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
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                "What would you like to find?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                ),
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
            if (_selectedIndex == 1) const FineDineCarousel(),
            if (_selectedIndex == 2) const BestCafeCarousel(),
            if (_selectedIndex == 3) const PubCarousel(),
            const SizedBox(
              height: 20.0,
            ),
            if (_selectedIndex == 0) const HotelCarousel(),
            if (_selectedIndex == 1) const FamilyStyleCarousel(),
            if (_selectedIndex == 2) const CoffeeCarousel(),
            if (_selectedIndex == 3) const BarCarousel(),
          ],
        ),
      ),
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
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.backpack,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}