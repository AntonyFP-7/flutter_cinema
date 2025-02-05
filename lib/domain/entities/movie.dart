import 'dart:convert';

class Movie {
  final bool adult;
  final String backdropPath;
  final List<String> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie(
      {required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  Map<String, dynamic> toMap() => {
        "id": id,
        "backdropPath": backdropPath,
        "posterPath": posterPath,
        "title": title,
        "releaseDate":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "voteAverage": voteAverage,
        "originalLanguage": originalLanguage,
        "originalTitle": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "adult": adult,
        "video": video,
        "voteCount": voteCount
      };
       //"genreIds": List<dynamic>.from(genreIds.map((x) => x)),
}
