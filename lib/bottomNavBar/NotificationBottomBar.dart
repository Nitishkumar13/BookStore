import 'package:flutter/material.dart';

class NotificationBottomBar extends StatefulWidget {
  const NotificationBottomBar({super.key});

  @override
  State<NotificationBottomBar> createState() => _NotificationBottomBarState();
}

class _NotificationBottomBarState extends State<NotificationBottomBar> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Welcome to the notification page",
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }
}
