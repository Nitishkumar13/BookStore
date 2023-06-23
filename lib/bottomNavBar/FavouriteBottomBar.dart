import 'package:flutter/material.dart';

class FavouriteBottomBar extends StatefulWidget {
  const FavouriteBottomBar({super.key});

  @override
  State<FavouriteBottomBar> createState() => _FavouriteBottomBarState();
}

class _FavouriteBottomBarState extends State<FavouriteBottomBar> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Welcome to the Favourite  Page",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }
}
