import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';

class HomeScreend extends StatelessWidget {
  static const String name = "home-screend";
  const HomeScreend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.theMovieDbKey),
      ),
    );
  }
}
