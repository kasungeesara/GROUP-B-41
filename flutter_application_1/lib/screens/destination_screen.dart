import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/activity_screen.dart';
import 'package:flutter_application_1/widgets/activity.dart';
import 'package:flutter_application_1/widgets/destination_carousel.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({required this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imagePath,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(widget.destination.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_rounded),
                      iconSize: 30,
                      color: Colors.white,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.search_rounded),
                          iconSize: 30,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.sort_rounded),
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
                        widget.destination.city,
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
                            widget.destination.province,
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
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = activities[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ActivityScreen(
                        activity: activity,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
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
                                  Container(
                                    width: 120.0,
                                    child: Text(
                                      activity.name,
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
                                        '\$${activity.price}',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Text(
                                        'per adult',
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
                                activity.type,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Outfit-Regular",
                                  color: Colors.black,
                                ),
                              ),
                              _buildRatingStars(activity.rating),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  if (activity.startTimes.length > 0) ...[
                                    Container(
                                      padding: EdgeInsets.all(1.0),
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            195, 14, 192, 106),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        activity.startTimes[0],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                  ],
                                  if (activity.startTimes.length > 1) ...[
                                    Container(
                                      padding: EdgeInsets.all(1.0),
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            195, 14, 192, 106),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        activity.startTimes[1],
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
                            image: AssetImage(activity.imagePath),
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