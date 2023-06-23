import 'package:book_store/bottomNavBar/FavouriteBottomBar.dart';
import 'package:book_store/bottomNavBar/HomeBottomBar.dart';
import 'package:book_store/bottomNavBar/NotificationBottomBar.dart';
import 'package:book_store/bottomNavBar/SettingBottomBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    const HomeBottomBar(),
    const NotificationBottomBar(),
    const FavouriteBottomBar(),
    const SettingBottomBar(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add_outlined),
                label: "Notification"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: "Favourite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ]),
    );
  }
}
