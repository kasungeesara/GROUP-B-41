import 'package:flutter/material.dart';
import 'package:travel_app/Data/city_based_coffeecuisine.dart';
import 'package:travel_app/Data/coffee_cuisine.dart';
import 'package:travel_app/Models/city_coffeecuisine.dart';
import 'package:travel_app/Models/coffee_cuisine.dart';

class CoffeeCuisinetList extends StatefulWidget {
  final CoffeeCuisine city;

  const CoffeeCuisinetList({
    super.key,
    required this.city,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CoffeeCuisinetListState createState() => _CoffeeCuisinetListState();
}

class _CoffeeCuisinetListState extends State<CoffeeCuisinetList> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '★ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    final filteredActivities = citycoffeecuisines
        .where((act) => act.baseCity.contains(widget.city.city))
        .toList();

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.city.imagePath,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(widget.city.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded),
                      iconSize: 30,
                      color: Colors.white,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.search_rounded),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.sort_rounded),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        widget.city.city,
                        style: const TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit-Regular",
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.compass_calibration_rounded,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            widget.city.province,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Outfit-Regular",
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 30,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: filteredActivities.length,
              itemBuilder: (BuildContext context, int index) {
                CityCoffeeCuisine coffeecafe = filteredActivities[index];

                return GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120.0,
                                    child: Text(
                                      coffeecafe.name,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Outfit-Regular",
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${coffeecafe.price}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Text(
                                        'Price range',
                                        style: TextStyle(
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                coffeecafe.city,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Outfit-Regular",
                                  color: Colors.black,
                                ),
                              ),
                              _buildRatingStars(coffeecafe.rating),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  if (coffeecafe.startTimes.isNotEmpty) ...[
                                    Container(
                                      padding: const EdgeInsets.all(1.0),
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            195, 14, 192, 106),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        coffeecafe.startTimes[0],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5.0),
                                  ],
                                  if (coffeecafe.startTimes.length > 1) ...[
                                    Container(
                                      padding: const EdgeInsets.all(1.0),
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            195, 14, 192, 106),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        coffeecafe.startTimes[1],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: AssetImage(coffeecafe.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
