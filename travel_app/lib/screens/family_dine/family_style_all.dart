import 'package:flutter/material.dart';
import 'package:travel_app/Data/family_dines.dart';
import 'package:travel_app/Models/family_dine.dart';
import 'package:travel_app/screens/family_dine/family_dine_details.dart';

class FamilyStyleAll extends StatefulWidget {
  const FamilyStyleAll({super.key});

  @override
  State<FamilyStyleAll> createState() => _FamilyStyleAllState();
}

class _FamilyStyleAllState extends State<FamilyStyleAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Family Dine",
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
              itemCount: familyDines.length,
              itemBuilder: (BuildContext context, int index) {
                FamilyDine familyStyle = familyDines[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>  FamilyDineDetails(
                        familyStyles: familyStyle,
                      ),
                    ),
                  ),
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
                          child: SingleChildScrollView(
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
                                      width: 150,
                                      child: Text(
                                        familyStyle.name,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(1.0),
                                  width: 80,
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
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        familyStyle.city,
                                        style: const TextStyle(
                                          fontSize: 12.4,
                                          fontFamily: "Outfit-Regular",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          familyStyle.range,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Outfit-Regular",
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                         familyStyle.price,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Outfit-Regular",
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                               
                              ],
                            ),
                            
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
                            image: AssetImage(familyStyle.imagePath),
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