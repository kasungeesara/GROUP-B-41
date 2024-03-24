import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/Models/hotel.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetails extends StatefulWidget {
  // ignore: use_super_parameters
  const HotelDetails({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  // ignore: library_private_types_in_public_api
  _HotelDetailsState createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    tag: widget.hotel.imagePath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(widget.hotel.imagePath),
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
                            onPressed: () {},
                            icon: const Icon(Icons.search_rounded),
                            iconSize: 30,
                            color: Colors.white,
                          ),
                          IconButton(
                            onPressed: () {},
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
                          widget.hotel.name,
                          style: const TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
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
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.location_on_outlined,
                    size: 18.0,
                    color: Color.fromARGB(255, 108, 108, 108),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    widget.hotel.address,
                    style: const TextStyle(
                      fontSize: 15.5,
                      fontFamily: "Outfit-Regular",
                      color: Color.fromARGB(255, 108, 108, 108),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.call_end_outlined,
                    size: 18.0,
                    color: Color.fromARGB(255, 108, 108, 108),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    widget.hotel.tel,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "Outfit-Regular",
                      color: Color.fromARGB(255, 108, 108, 108),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.star_rounded,
                    size: 22.0,
                    color: Color.fromARGB(195, 14, 192, 106),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    size: 22.0,
                    color: Color.fromARGB(195, 14, 192, 106),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    size: 22.0,
                    color: Color.fromARGB(195, 14, 192, 106),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    size: 22.0,
                    color: Color.fromARGB(195, 14, 192, 106),
                  ),
                  const Icon(
                    Icons.star_half_rounded,
                    size: 22.0,
                    color: Color.fromARGB(195, 14, 192, 106),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    widget.hotel.type,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "Outfit-Regular",
                      color: Color.fromARGB(255, 74, 73, 73),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 175.0),
                  Text(
                    '\$${widget.hotel.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Outfit-Regular",
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 320),
              child: Row(
                children: [
                  Text(
                    '(per night)',
                    style: TextStyle(
                      fontFamily: "Outfit-Regular",
                      color: Color.fromARGB(255, 108, 108, 108),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 18),
              child: Text(
                "Facilities",
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  color: Colors.black,
                ),
              ),
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
                widget.hotel.about,
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
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Text(
                "Location",
                style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  color: Colors.black,
                ),
              ),
            ),
            Container(),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 2),
              child: Text(
                widget.hotel.directions,
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
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        _launchURL(widget.hotel.url);
                      },
                      icon: const Icon(Icons.search_rounded),
                      iconSize: 20,
                      color: const Color.fromARGB(255, 78, 71, 216),
                    ),
                    const SizedBox(width: 5.0),
                    const Text(
                      "Visit Page",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Outfit-Regular",
                        color: Color.fromARGB(255, 78, 71, 216),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> _buildFacilityButtons() {
    return [
      _buildFacilityButton(Icons.wifi, "Free WiFi"),
      _buildFacilityButton(Icons.pool, "Swimming Pool"),
      _buildFacilityButton(Icons.spa, "Spa"),
      _buildFacilityButton(Icons.local_parking, "Parking"),
      _buildFacilityButton(Icons.restaurant, "Restaurant"),
      _buildFacilityButton(Icons.local_bar, "Bar"),
      _buildFacilityButton(Icons.ac_unit_rounded, "Air Conditioner"),
      _buildFacilityButton(Icons.fitness_center_rounded, "GYM"),
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
