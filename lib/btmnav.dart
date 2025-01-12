import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:silkspace_delivery/Homepage.dart';
import 'package:silkspace_delivery/Youpage.dart';

class btmnav extends StatefulWidget {
  const btmnav({super.key});

  @override
  State<btmnav> createState() => _btmnavState();
}

class _btmnavState extends State<btmnav> {
  int currentindex = 0;

  List screens = [Homepage(),Youpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          padding: EdgeInsets.symmetric(horizontal: 5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          backgroundColor: Colors.black54,
          elevation: 50,
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blue[600],
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: 'Profile'),
          ]),
    );
  }
}
