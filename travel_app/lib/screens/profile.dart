import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = 'Lewis 44';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/lewis.jpg"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(195, 14, 192, 106),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_rounded,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _userName,
              style: const TextStyle(
                letterSpacing: 1.2,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit-Regular",
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(195, 14, 192, 106),
                ),
              ),
              onPressed: () {
                _showChangeNameDialog(context);
              },
              child: const Text(
                'Change Name',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            const SizedBox(height: 15),
            _buildProfileInfo(title: 'First Name', value: 'Lewis'),
            const SizedBox(height: 15),
            _buildProfileInfo(title: 'Last Name', value: 'Hamilton'),
            const SizedBox(height: 15),
            _buildProfileInfo(title: 'Email', value: 'Roscoe<3@gmail.com'),
            const SizedBox(height: 15),
            _buildProfileInfo(title: 'Phone', value: '0774444408'),

          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo({required String title, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: "Outfit-Regular",
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontFamily: "Outfit-Regular",
            ),
          ),
        ],
      ),
    );
  }

  void _showChangeNameDialog(BuildContext context) {
    String newName = _userName;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Change Name',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit-Regular",
                color: Colors.black),
          ),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter new name',
              hintStyle: TextStyle(
                fontSize: 16,
                fontFamily: "Outfit-Regular",
                color: Colors.grey,
              ),
            ),
            onChanged: (value) {
              newName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _userName = newName;
                });
                Navigator.pop(context);
              },
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  color: Color.fromARGB(195, 14, 192, 106),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                  color: Color.fromARGB(195, 14, 192, 106),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
