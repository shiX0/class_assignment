import 'package:class_test/models/name_model.dart';
import 'package:class_test/screens/grid_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => GridScreen(nameModel: nameModel)));
    });
    super.initState();
  }

  NameModel nameModel = NameModel(name: "SHISHIR");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "WELCOME ${nameModel.name}!",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
