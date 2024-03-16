import 'package:flutter/material.dart';
import 'package:travel_app/screens/surf_screen.dart';

class HomeBanner2 extends StatelessWidget {
  const HomeBanner2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const SurfScreen(),
                    ),
                  );
                },
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
    );
  }
}
