import 'package:flutter/material.dart';
import 'package:travel_app/Data/dine_draft.dart';
import 'package:travel_app/Models/dine_draft.dart';

class DineDraftAll extends StatefulWidget {
  const DineDraftAll({super.key});

  @override
  State<DineDraftAll> createState() => _DineDraftAllState();
}

class _DineDraftAllState extends State<DineDraftAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dine & Draft",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Outfit-Regular",
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: dinedraft.length,
              itemBuilder: (BuildContext context, int index) {
                DineDraft dinedrafteatall = dinedraft[index];
                return GestureDetector(
                  /// onTap: () => Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  //builder: (_) => DineDraftDetails(
                  // city: citydinedrafts,
                  // ),
                  // ),
                  // ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      dinedrafteatall.city,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Outfit-Regular",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                padding: const EdgeInsets.all(1.0),
                                width: 150,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(195, 14, 192, 106),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Icon(
                                      Icons.compass_calibration_rounded,
                                      size: 8.0,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      dinedrafteatall.province,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Outfit-Regular",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    dinedrafteatall.description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Outfit-Regular",
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 15,
                        bottom: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: AssetImage(dinedrafteatall.imagePath),
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
