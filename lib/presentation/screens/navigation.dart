import 'package:flutter/material.dart';
import 'package:riick_and_morty/presentation/screens/CharacterList.dart';
import 'package:riick_and_morty/presentation/screens/widgets/bottom_navBar.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;
  List<Widget> screens = [
    const CharactersList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavBarWidget(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentInxdex: currentIndex,
      ),
    );
  }
}
