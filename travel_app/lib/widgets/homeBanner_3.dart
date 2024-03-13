import 'package:flutter/material.dart';

class HomeBanner3 extends StatelessWidget {
  const HomeBanner3({super.key});

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
                  image: AssetImage("assets/cot.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 12,
              child: ElevatedButton(
                onPressed: () {},
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
              top: 320,
              left: 10,
              child: Text(
                "Eco-Friendly\nHotels in\nSri Lanka",
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
              bottom: 65,
              left: 10,
              child: Text(
                "Eco-friendly hotels prioritize sustainable practices to\nminimize their environmental impact while offering guests\na unique and responsible travel experience",
                style: TextStyle(
                  fontSize: 13,
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
