import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Models/destination.dart';
import 'package:travel_app/screens/destination/destination_activity.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({
    super.key,
    required this.destination,
  });
  final Destination destination;
  @override
  // ignore: library_private_types_in_public_api
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  String docName = "";
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '★ ';
    }
    stars.trim();
    return Text(stars);
  }

  //List<Activity> availableActivities = [];

  @override
  Widget build(BuildContext context) {
    // if (widget.destination.city == "Kandy") {
    //   docName = "activityKandy";
    // } else if (widget.destination.city == "Galle") {
    //   docName = "activityGalle";
    // } else if (widget.destination.city == "Colombo") {
    //   docName = "activityColombo";
    // } else if (widget.destination.city == "Sigiriya") {
    //   docName = "activitySigiriya";
    // } else if (widget.destination.city == "Nuwara Eliya") {
    //   docName = "activityNuwaraEliya";
    // } else {
    //   docName = "activity";
    // }

    docName = "activityKandy";

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
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection(docName).snapshots(),
            builder: (cxt, chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text("No places added"),
                );
              }

              if (chatSnapshot.hasError) {
                return const Center(
                  child: Text("Somthing went wrong"),
                );
              }

              final loadedData = chatSnapshot.data!.docs;
              print(
                  "...................................................................................${loadedData.length}");

              return Expanded(
                child: ListView.builder(
                  reverse: false,
                  itemCount: loadedData.length,
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                  itemBuilder: (context, index) {
                    final currentData = loadedData[index].data();

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => ActivityScreen(
                              imageUrl: currentData["imagePath"],
                              name: currentData["name"],
                              type: currentData["type"],
                              price: currentData["price"],
                              startTime: currentData["startTimes"][0],
                              endTime: currentData["startTimes"][1],
                              rating: currentData["rating"],
                              description: currentData["description"],
                            ),
                          ),
                        );
                      },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 120.0,
                                        child: Text(
                                          currentData["name"],
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
                                            '\$${currentData["price"]}',
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
                                    currentData["type"],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Outfit-Regular",
                                      color: Colors.black,
                                    ),
                                  ),
                                  _buildRatingStars(currentData["rating"]),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      if (currentData.isNotEmpty) ...[
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
                                            currentData["startTimes"][0],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Outfit-Regular",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                      ],
                                      if (currentData["startTimes"].length >
                                          1) ...[
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
                                            currentData["startTimes"][1],
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
                                image: NetworkImage(currentData["imagePath"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
