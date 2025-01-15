import 'package:cinemapedia/presentation/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreend.name,
    builder: (context, state) => HomeScreend(),
  ),
]);
