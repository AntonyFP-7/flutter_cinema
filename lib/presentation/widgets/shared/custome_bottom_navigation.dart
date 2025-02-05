import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomeBottomNavigation extends StatelessWidget {
  final int pageIndex;
  const CustomeBottomNavigation({super.key, required this.pageIndex});
  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
      case 1:
        context.go('/home/0');
      case 2:
        context.go('/home/2');
      default:
        context.go('/home/0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: pageIndex,
        onTap: (value) => onItemTapped(context, value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.label_outline),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favoritos',
          ),
        ]);
  }
}
