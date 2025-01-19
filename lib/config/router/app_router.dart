import 'package:cinemapedia/presentation/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreend.name,
    builder: (context, state) => HomeScreend(),
    routes: [
      GoRoute(
        path: 'movie/:id',
        //name: MovieScreen.name,
        builder: (context, state) {
          final movieId = state.pathParameters["id"] ?? "no-id";
          return MovieScreen(movieId: movieId);
        },
      ),
    ],
  ),
  GoRoute(
    path: '/movie/:id',
    name: MovieScreen.name,
    builder: (context, state) {
      final movieId = state.pathParameters["id"] ?? "no-id";
      return MovieScreen(movieId: movieId);
    },
  ),
]);
