import 'package:flutter/material.dart';

class SettingBottomBar extends StatefulWidget {
  const SettingBottomBar({super.key});

  @override
  State<SettingBottomBar> createState() => _SettingBottomBarState();
}

class _SettingBottomBarState extends State<SettingBottomBar> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Welcome to the Setting Page",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }
}
