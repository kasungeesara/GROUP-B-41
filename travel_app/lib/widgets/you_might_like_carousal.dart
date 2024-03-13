import 'package:flutter/material.dart';
import 'package:travel_app/Data/you-might_like.dart';
import 'package:travel_app/Models/youmight.dart';
import 'package:travel_app/screens/you_might_like_screen.dart';
import 'package:travel_app/widgets/innerWidgets/youMightLikeCarousalCard.dart';

class YouMightCarousel extends StatelessWidget {
  const YouMightCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "You might like these ",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              YouMight youmightlike = youmight[index];

              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => YouMightDetails(
                      youMight: youmightlike,
                    ),
                  ),
                ),
                child: YouMightLikeCarousalCard(youmightlike: youmightlike)
              );
            },
          ),
        ),
      ],
    );
  }
}
