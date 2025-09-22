import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:silkspace_delivery/presentation/HomePage.dart';
import 'package:silkspace_delivery/presentation/Youpage.dart';

class Btmnav extends StatefulWidget {
  const Btmnav({super.key});

  @override
  State<Btmnav> createState() => _BtmnavState();
}

class _BtmnavState extends State<Btmnav> {
  int currentindex = 0;

  List screens = [const HomePage(), const Youpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          shape: const RoundedRectangleBorder(
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
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: 'Profile'),
          ]),
    );
  }
}
