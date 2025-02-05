import 'package:cinemapedia/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreend extends StatelessWidget {
  static const String name = "home-screend";
  final int pageIndex;
  const HomeScreend({super.key, required this.pageIndex});
  final viewRoutes = const <Widget>[HomeView(), SizedBox(), FavoritesView()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomeBottomNavigation(pageIndex: pageIndex),
    );
  }
}
