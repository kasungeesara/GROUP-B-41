import 'package:flutter/material.dart';
import 'package:travel_app/Models/activity.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({
    super.key,
    required this.activity,
  });

  final Activity activity;
  @override
  // ignore: library_private_types_in_public_api
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  Row buildRatingStars(int rating) {
    List<Widget> starIcons = [];
    for (int i = 0; i < rating; i++) {
      starIcons.add(
        const Icon(
          Icons.star_rounded,
          size: 22.0,
          color: Color.fromARGB(195, 14, 192, 106),
        ),
      );
    }
    return Row(
      children: starIcons,
    );
  }

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
                    tag: widget.activity.imagePath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(widget.activity.imagePath),
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
                          widget.activity.name,
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
                              Icons.merge_type_outlined,
                              size: 25.0,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              widget.activity.type,
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildRatingStars(widget.activity.rating),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Text(
                          '(Rating)',
                          style: TextStyle(
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 108, 108, 108),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 110,),
                  Text(
                    '\$${widget.activity.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Outfit-Regular",
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Text(
                          '(per adult)',
                          style: TextStyle(
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 108, 108, 108),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Open Hours :  ",
                  style: TextStyle(
                    letterSpacing: 1.2,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Outfit-Regular",
                    color: Colors.black,
                  ),
                ),
                if (widget.activity.startTimes.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(1.0),
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(195, 14, 192, 106),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.activity.startTimes[0],
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Outfit-Regular",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                ],
                if (widget.activity.startTimes.length > 1) ...[
                  Container(
                    padding: const EdgeInsets.all(1.0),
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(195, 14, 192, 106),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.activity.startTimes[1],
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Outfit-Regular",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(
              height: 10,
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
                widget.activity.description,
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
      _buildFacilityButton(Icons.book, "Education"),
      _buildFacilityButton(Icons.card_giftcard, "Souvenirs"),
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
