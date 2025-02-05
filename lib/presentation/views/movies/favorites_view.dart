import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMovieProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMovieProvider).values.toList();
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (Context, index) {
        return Text(favoriteMovies[index].title);
      }),
    );
  }
}
