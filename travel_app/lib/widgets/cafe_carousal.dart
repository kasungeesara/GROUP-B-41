import 'package:flutter/material.dart';
import 'package:travel_app/screens/cafe/bestcafe_all.dart';
import 'package:travel_app/screens/cafe/cafe_details.dart';

class BestCafe {
  final String name;
  final String range;
  final String description;
  final String city;
  final String imagePath;
  final String price;
  final String address;
  final String tel;
  final List<String> startTimes;

  BestCafe({
    required this.name,
    required this.range,
    this.description = '',
    required this.city,
    required this.imagePath,
    required this.price,
     required this.tel,
    required this.startTimes,
    required this.address,
  });
}

final List<BestCafe> bestCafes = [
  BestCafe(
    name: 'Cafe Kumbuk',
    city: 'Colombo',
    range: "4.8",
    description: "Day-dreaming by a shady grove of Kumbuk trees in our magical island home of Sri Lanka, Café Kumbuk was a dream inspired by many years of living away from our motherland.Roaming the bustling streets of East London, soaking up culture, meeting wonderful people and tantalizing the taste buds with world food, it was these experiences that spurred us to create our very own downtown café-space.",
    imagePath: "assets/cafe11.png",
    price: "\$2-\$10",
    tel: "0112 685 310",
    address: "No.3/1 Thambiah Avenue,Independence Ave.",
    startTimes: ['09 AM', '06 PM'],
  ),
  BestCafe(
    name: "The t-Lounge",
    city: 'Colombo',
    range: "4.7",
    description: "The t-Lounge is an upscale, elegant place designed around the enjoyment and appreciation of fine tea; complemented by light snacks and tea inspired food and beverages. The t-Lounge by Dilmah is unique in that our emphasis on tea is founded on our passionate commitment to tea as tea growers and a family business; established and headed by the world’s most experienced tea maker; the first tea grower to offer his tea direct to tea drinkers around the world.",
    imagePath: "assets/cafe2.jpg",
    price: "\$2-\$10",
    tel: "0112 447 168",
    address: "No.62/2,Chatham Street,Colombo",
    startTimes: ['09 AM', '07 PM'],
  ),
  BestCafe(
    name: 'Seed Cafe',
    city: 'Colombo',
    range: "4.5",
    description: "Colombo doesn't necessarily have many vegan-friendly restaurants, at least, not ones where you can go to without feeling your wallet dip considerably. This is where Seed Cafe comes into view. Done as the love child between the likes of The Grind and Ceylon Superfoods Company, Seed Cafe joined the cafe scene in Colombo not too long ago in the same place Cafe Kumbuk used to be. ",
    imagePath: "assets/cafe3.jpg",
    price: "\$2-\$10",
    tel: "0117 773 470",
    address: "Horton Place, Colombo 07 US Embassy, Colombo ",
    startTimes: ['08 AM', '06 PM'],
  ),
  BestCafe(
    name: 'Secret Alley',
    city: 'Kandy',
    range: "4.6",
    description: "Cafe Secret Alley is a perfect place to taste vegetarian friendly foods, vegan foods and gluten free foods.They Offer All day Breakfast | Pancakes | Lunch | Brunch |Coffee | Detox | Smoothie Bowls | Fresh JuicesIts a calm and friendly place with some good vibes and tunes to get relaxed.",
    imagePath: "assets/cafe4.jpg",
    price: "\$2-\$10",
    tel: "077 303 2933",
    address: "No.10/1/1/1,E L Senanayake Veediya,Kandy",
    startTimes: ['10 AM', '05 PM'],
  ),
  BestCafe(
    name: 'Cafe Nuwara',
    city: 'Kandy',
    range: "4.5",
    description: "Nestled in the heart of Kandy, Sri Lanka, Café Nuwara invites you to embark on a culinary journey that marries tradition with innovation. Steeped in the enchanting allure of colonial charm, our café offers a unique experience where history and flavor intertwine.tep into Café Nuwara and be transported to an era of elegance and refinement. Our colonial-inspired ambiance pays homage to Kandy's regal legacy, while our modern approach to cuisine sets the stage for a gastronomic adventure.",
    imagePath: "assets/cafe5.jpg",
    price: "\$2-\$10",
    tel: "076 022 1222",
    address: "No.146 DS Senanayake Veediya,Kandy",
    startTimes: ['10 AM', '10 PM'],
  ),
];

class BestCafeCarousel extends StatelessWidget {
  const BestCafeCarousel({super.key});

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
                "Cafés",
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
                      builder: (ctx) => const CafeAll(),
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
            itemCount: bestCafes.length,
            itemBuilder: (BuildContext context, int index) {
              BestCafe bestcafes = bestCafes[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CafeDetails(
                      bestcafe: bestCafes[index],
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
                                  bestcafes.price,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style:  const TextStyle(
                                    fontFamily: "Outfit-Regular",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  "(Price Range)",
                                  style:  TextStyle(
                                    letterSpacing: 1.2,
                                    fontSize: 15,
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
                              tag: bestcafes.imagePath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(bestcafes.imagePath),
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
                                      bestcafes.name,
                                      style: const TextStyle(
                                        letterSpacing: 1.2,
                                        fontSize: 22,
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
                                          bestcafes.city,
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
