
import 'package:flutter/material.dart';
import 'package:travel_app/screens/heritage_screen.dart';

class HomeBanner1 extends StatelessWidget {
  const HomeBanner1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
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
                 onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const HeritageScreen(),
                    ),
                  );
                },
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
              left: 73,
              child: Text(
                "Discover Heritage Sites\n          in Sri Lanka",
                style: TextStyle(
                  fontSize: 23,
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
    );
  }
}
