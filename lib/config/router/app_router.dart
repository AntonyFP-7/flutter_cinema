import 'package:cinemapedia/presentation/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
/*   GoRoute(
    path: '/',
    name: HomeScreend.name,
    builder: (context, state) => HomeScreend(childVew: HomeView()),
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
  ), */
  ShellRoute(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            return HomeView();
          },
          routes: [
            GoRoute(
              path: '/movie/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters["id"] ?? "no-id";
                return MovieScreen(movieId: movieId);
              },
            ),
          ]),
      GoRoute(
        path: '/favorites',
        builder: (context, state) {
          return FavotiresView();
        },
      ),
    ],
    builder: (context, state, child) {
      return HomeScreend(childVew: child);
    },
  ),
]);
