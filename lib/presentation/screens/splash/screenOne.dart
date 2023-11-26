import 'package:flutter/material.dart';
import 'package:riick_and_morty/presentation/screens/splash/screenTwo.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
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
            'assets/images/screenOne.png',
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
        builder: (context) => const ScreenTwo(),
      ),
    );
  }
}
