import 'package:flutter/material.dart';
import 'package:travel_app/screens/profile.dart';
import 'package:travel_app/widgets/bar_carousal.dart';
import 'package:travel_app/widgets/cafe_carousal.dart';
import 'package:travel_app/widgets/coffe_carousal.dart';
import 'package:travel_app/widgets/destination_carousel.dart';
import 'package:travel_app/widgets/fine_dining_carousel.dart';
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

  void _navigateToProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
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
        if (index == 0) {
          setState(() {
            _selectedIndex = 0;
          });
        }
        if (index == 1) {
          setState(() {
            _selectedIndex = 1;
          });
        }
        if (index == 2) {
          setState(() {
            _selectedIndex = 2;
          });
        }
        if (index == 3) {
          setState(() {
            _selectedIndex = 3;
          });
        }
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
            if (_selectedIndex == 1) const HotelCarousel(),
            if (_selectedIndex == 2) const FineDineCarousel(),
            if (_selectedIndex == 3) const BestCafeCarousel(),

            const SizedBox(height: 8.0,),

            if (_selectedIndex == 1) const HotelCityCarousel(),
            if (_selectedIndex == 2) const PubCarousel(),
            if (_selectedIndex == 3) const CoffeeCarousel(),

            const SizedBox(height: 8.0,),

            if (_selectedIndex == 2) const BarCarousel(),
            if (_selectedIndex == 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/k20.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 90,
                        left: 90,
                        child: ElevatedButton(
                          onPressed: () {} 
                          ,
                          child: const Text(
                            "Keep exploring",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Outfit-Regular",
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 60,
                        left: 90,
                        child: Text(
                          "Discover more in \n          Kandy",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 249, 249, 249),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 25,
            ),
            if (_selectedIndex == 0) const YouMightCarousel(),
            if (_selectedIndex == 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 600,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/surf5.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 12,
                        child: ElevatedButton(
                          onPressed: () {} ,
                          child: const Text(
                            "Read more",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Outfit-Regular",
                              color: Colors.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 350,
                        left: 10,
                        child: Text(
                          "10 best places to \nsurf in\nSri lanka",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 249, 249, 249),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 60,
                        left: 10,
                        child: Text(
                          "The south and east coasts of Sri Lanka \nare home to the best surf spots",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 249, 249, 249),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
              if (value == 2) {
                _navigateToProfileScreen(context);
              }
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
                Icons.map_outlined,
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
