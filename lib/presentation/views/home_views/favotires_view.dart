import 'package:flutter/material.dart';

class FavotiresView extends StatelessWidget {
  const FavotiresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favotires'),
      ),
      body: Center(
        child: Text('Favotires'),
      ),
    );
  }
}
