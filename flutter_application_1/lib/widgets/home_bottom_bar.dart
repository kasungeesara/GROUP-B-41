import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.map_outlined,
              size: 30,
            ),
            label: '',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.person,
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
