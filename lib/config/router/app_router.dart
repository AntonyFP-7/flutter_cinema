import 'package:cinemapedia/presentation/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
    path: '/home/:page',
    name: HomeScreend.name,
    builder: (context, state) {
      final pageIndex = state.pathParameters["page"] ?? '0';
      return HomeScreend(pageIndex: int.parse(pageIndex));
    },
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
/*   GoRoute(
    path: '/movie/:id',
    name: MovieScreen.name,
    builder: (context, state) {
      final movieId = state.pathParameters["id"] ?? "no-id";
      return MovieScreen(movieId: movieId);
    },
  ), */
  GoRoute(path: '/', redirect: (_, __) => '/home/0'),
]);
