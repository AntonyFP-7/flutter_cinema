import 'package:cinemapedia/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreend extends StatelessWidget {
  static const String name = "home-screend";
  const HomeScreend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomeBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRateMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSliderShow = ref.watch(moviesSliderShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRateMovies = ref.watch(topRateMoviesProvider);
    return FullScreenLoader();

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomeAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              //CustomeAppbar(),
              MoviesSliderShow(movies: moviesSliderShow),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Proximamente',
                subTitle: 'En este mes',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: popularMovies,
                title: 'Polulares',
                //subTitle: 'En este mes',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: topRateMovies,
                title: 'Mejor calificadas',
                subTitle: 'Desde siempre',
                loadNextPage: () =>
                    ref.read(topRateMoviesProvider.notifier).loadNextPage(),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
        childCount: 1,
      )),
    ]);
  }
}
