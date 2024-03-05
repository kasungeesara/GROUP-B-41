import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cafe.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/pub.dart';
import 'package:flutter_application_1/widgets/family_style.dart';
import 'package:flutter_application_1/widgets/fine_dining_carousel.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
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
        if (index == 0) {
          setState(() {
            _selectedIndex = 0;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
        if (index == 1) {
          setState(() {
            _selectedIndex = 1;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Restaurants()),
          );
        }
        if (index == 2) {
          setState(() {
            _selectedIndex = 2;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cafe()),
          );
        }
        if (index == 3) {
          setState(() {
            _selectedIndex = 3;
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Pub()),
          );
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
            FineDineCarousel(),
            const SizedBox(
              height: 20.0,
            ),
            FamilyStyleCarousel(),
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
