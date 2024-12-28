import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_tab.dart';
import 'package:todo_app/screens/home/love_tab.dart';
import 'package:todo_app/screens/home/map_tab.dart';
import 'package:todo_app/screens/home/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, child: Icon(Icons.add, color: Colors.white, size:30),),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {

            });

          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.pin_drop_outlined), label: "Map"),
            BottomNavigationBarItem(
                icon: Icon(Icons.heart_broken), label: "Love"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Profile"),
          ]),
      body: currentTabs[selectedIndex],
    );
  }

  List<Widget> currentTabs = [
    HomeTab(),
    MapTab(),
    LoveTab(),
    ProfileTab(),
  ];
}
