import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatasource extends LocalStorageDatasource {
  static final SqliteDatasource _instance = SqliteDatasource._internal();
  static Database? _database;

  factory SqliteDatasource() {
    return _instance;
  }

  SqliteDatasource._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'movies.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE movies (
        id INTEGER PRIMARY KEY,
        backdropPath TEXT NULL,
        posterPath TEXT NULL,
        title TEXT NULL,
        releaseDate TEXT NULL,
        voteAverage REAL NULL,
        originalLanguage TEXT NULL,
        originalTitle TEXT NULL,
        overview TEXT NULL,
        popularity REAL NULL,
        adult INTEGER NULL,
        video INTEGER NULL,
        voteCount INTEGER NULL,
        )
        ''');
  }

//genreIds TEXT NULL,
  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final db = await database;
    final List<Map<String, dynamic>> movie =
        await db.query('movies', where: 'id = ?', whereArgs: [movieId]);
    return movie.length == 1 ? true : false;
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 10, offset = 0}) async {
    final db = await database;
    final List<Map<String, dynamic>> movies =
        await db.query('movies', limit: limit, offset: offset);
    return List.generate(movies.length, (i) {
      return Movie(
        id: movies[i]['id'],
        backdropPath: movies[i]['backdropPath'] ?? '',
        posterPath: movies[i]['posterPath'] ?? '',
        title: movies[i]['title'],
        releaseDate: DateTime.now(),
        adult: movies[i]['adult'] == 1 ? true : false,
        genreIds: [],
        voteAverage: movies[i]['voteAverage'] ?? 0.0,
        voteCount: movies[i]['voteCount'] ?? 0,
        originalLanguage: movies[i]['originalLanguage'] ?? 'es',
        originalTitle: movies[i]['originalTitle'] ?? '',
        overview: movies[i]['overview'] ?? '',
        popularity: movies[i]['popularity'] ?? 0,
        video: movies[i]['video'] == 1 ? true : false,
      );
    });
  }

  @override
  Future<void> toggleFavotite(Movie movie) async {
    final db = await database;
    final List<Map<String, dynamic>> movieFavotite =
        await db.query('movies', where: 'id = ?', whereArgs: [movie.id]);
    if (movieFavotite.isEmpty) {
      await db.insert(
        'movies',
        movie.toMap(),
        conflictAlgorithm:
            ConflictAlgorithm.replace, //relplaza si el id se repite
      );
    } else {
      await db.delete('movies', where: 'id = ?', whereArgs: [movie.id]);
    }
  }
}
