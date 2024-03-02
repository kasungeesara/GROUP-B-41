import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/destination_screen.dart';
import 'package:flutter_application_1/screens/topDestination.dart';

class Destination {
  final String city;
  final int? activities;
  final String description;
  final String province;
  final String imagePath;

  Destination({
    required this.city,
    this.activities,
    this.description = '',
    required this.province,
    required this.imagePath,
  });
}

final List<Destination> destinations = [
  Destination(
    city: 'Kandy',
    province: 'Central Province',
    activities: 10,
    description: 'Beautiful city with rich culture and history.',
    imagePath: "assets/kandy.jpg",
  ),
  Destination(
    city: 'Galle',
    province: 'Southern Province',
    activities: 8,
    description: 'Historical city with a stunning fort.',
    imagePath: "assets/galle2.jpg",
  ),
  Destination(
    city: 'Colombo',
    province: 'Western Province',
    activities: 12,
    description: 'Capital city with vibrant nightlife and shopping.',
    imagePath: "assets/cmb.jpg",
  ),
  Destination(
    city: 'Sigiriya',
    province: 'Central Province',
    activities: 6,
    description: 'Home to the ancient rock fortress of Sigiriya.',
    imagePath: "assets/sigiriya2.jpg",
  ),
  Destination(
      city: 'Nuwara Eliya',
      province: 'Central Province',
      activities: 7,
      description:
          'Scenic city known for its tea plantations and cool climate.',
      imagePath: "assets/ne.jpg"),
  Destination(
      city: 'Anuradhapura',
      province: 'North Central Province',
      activities: 10,
      description:
          'Anuradhapura, a Ceylonese political and religious capital that flourished for 1,300 years, was abandoned after an invasion in 993.',
      imagePath: "assets/02.jpg"),
  Destination(
      city: 'Polonnaruwa',
      province: 'North Central Province',
      activities: 9,
      description:
          'The second oldest of all Sri Lankas kingdoms, Polonnaruwa was first established as a military post by the Sinhalese kingdom.',
      imagePath: "assets/pol.jpg"),
  Destination(
      city: 'Matara',
      province: 'Southern Province',
      activities: 5,
      description:
          'Matara is a major city in Sri Lanka, on the southern coast of Southern Province.',
      imagePath: "assets/mat.jpg"),
  Destination(
      city: 'Jaffna',
      province: 'North Province',
      activities: 10,
      description: 'Jaffna is a city on the northern tip of Sri Lanka.',
      imagePath: "assets/jaffna.jpg"),
  Destination(
      city: 'Trincomalee',
      province: 'Estern Province',
      activities: 7,
      description:
          'Trincomalee is a port city on the northeast coast of Sri Lanka.',
      imagePath: "assets/tri.jpg"),
];

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Top Destinations",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const TopDestination(),
                    ),
                  );
                },
                child: const Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit-Regular",
                    letterSpacing: 1.0,
                    color: Color.fromARGB(195, 14, 192, 106),
                  ),
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
              Destination destination = destinations[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(
                      destination: destination,
                    ),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 210,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 35.0,
                        child: Container(
                          height: 120,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Activities: ${destination.activities}",
                                  style: const TextStyle(
                                    fontFamily: "Outfit-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  destination.description,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    letterSpacing: 1.2,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Outfit-Regular",
                                    color: Color.fromARGB(255, 145, 145, 145),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: destination.imagePath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(destination.imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 8.0,
                              bottom: 1.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                      destination.city,
                                      style: const TextStyle(
                                        letterSpacing: 1.2,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Outfit-Regular",
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Row(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.compass_calibration_rounded,
                                          size: 10.0,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          destination.province,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Outfit-Regular",
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
