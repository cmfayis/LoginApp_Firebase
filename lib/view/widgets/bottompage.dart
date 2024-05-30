import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.white,
      unselectedIconTheme: const IconThemeData(color: Colors.black),
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: const Color.fromARGB(
          255, 134, 230, 163), // Set the background color to transparent
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Ionicons.add_circle),
        //   label: 'Add User',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
