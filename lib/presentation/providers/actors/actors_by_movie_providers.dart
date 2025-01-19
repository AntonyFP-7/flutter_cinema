import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovioNotifier, Map<String, List<Actor>>>(
        (ref) {
  final fetchMoreMovies = ref.watch(actorsRepositoryProvider);
  return ActorsByMovioNotifier(getActors: fetchMoreMovies.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovioNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovioNotifier({required this.getActors}) : super({});
  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actores = await getActors(movieId);
    state = {...state, movieId: actores};
  }
}
