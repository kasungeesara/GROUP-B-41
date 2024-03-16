import 'package:flutter/material.dart';
import 'package:travel_app/Models/youmight.dart';

class YouMightDetails extends StatelessWidget {
  const YouMightDetails({
    super.key,
    required this.youMight,
  });
  final YouMight youMight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    tag: youMight.imagePath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(youMight.imagePath),
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
                          youMight.name,
                          style: const TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 25,
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
                              youMight.province,
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
            const SizedBox(height: 8),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: _buildFacilityButtons(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "About",
                  style: TextStyle(
                    letterSpacing: 1.2,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit-Regular",
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 2),
                child: Text(
                  youMight.about,
                  style: const TextStyle(
                    letterSpacing: 1.2,
                    fontSize: 15.5,
                    fontFamily: "Outfit-Regular",
                    color: Color.fromARGB(255, 108, 108, 108),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
          ],
        ),
      ),
    );
  }
List<Widget> _buildFacilityButtons() {
    return [
      _buildFacilityButton(Icons.camera_alt, "Photography"),
      _buildFacilityButton(Icons.local_pizza, "Picnicking"),
      _buildFacilityButton(Icons.brightness_7, "Birdwatching"),
      _buildFacilityButton(Icons.sunny_snowing, "Sunset/Sunrise Viewing"),
    ];
  }

  Widget _buildFacilityButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(195, 14, 192, 106),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

