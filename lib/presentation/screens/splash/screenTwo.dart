import 'package:flutter/material.dart';
import 'package:riick_and_morty/presentation/screens/navigation.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/screenTwo.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Future<void> goToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Navigation(),
      ),
    );
  }
}
