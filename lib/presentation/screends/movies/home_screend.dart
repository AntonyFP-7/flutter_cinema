import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
class HomeScreend extends StatelessWidget {
  static const String name = "home-screend";
  final Widget childVew;
  const HomeScreend({super.key, required this.childVew});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: childVew,
      ),
      bottomNavigationBar: CustomeBottomNavigation(),
    );
  }
}


