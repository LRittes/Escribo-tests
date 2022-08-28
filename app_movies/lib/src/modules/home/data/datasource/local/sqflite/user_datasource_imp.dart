import 'package:app_movies/src/modules/home/data/datasource/interface/user_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/local/sqflite/db.dart';

class UserDatasourceImp implements UserDatasource {
  final String sqlSelectAll = 'SELECT * FROM ';
  final String sqlInsertUser = 'INSERT INTO user (id, avatar) VALUES (?,?)';
  final String sqlDeleteUser = 'DELETE FROM user WHERE id = ?';
  final String sqlInsertMovie =
      'INSERT INTO favMovies (idMovie, name, fav) VALUES (?,?,?)';
  final String sqlInsertCharacter =
      'INSERT INTO favCharacters (id, name, fav) VALUES (?,?,?)';

  @override
  Future<Map<String, dynamic>> getUser() async {
    final user = await DB().db!.rawQuery("$sqlSelectAll user");
    if (user.isNotEmpty) {
      final favMovies = await DB().db!.rawQuery("$sqlSelectAll favMovies");
      final favCharacters =
          await DB().db!.rawQuery("$sqlSelectAll favCharacters");

      return {
        "avatar": "${user[0]['avatar']}",
        "favMovies": favMovies,
        "favCharacters": favCharacters,
      };
    }
    return {
      "avatar": null,
      "favMovies": [],
      "favCharacters": [],
    };
  }

  @override
  Future<void> saveUser(Map<String, dynamic> user) async {
    await DB().db!.rawDelete(sqlDeleteUser, [1]);
    await DB().db!.rawInsert(sqlInsertUser, [1, user['avatar']]);
    for (var movie in user['favMovies']) {
      await DB()
          .db!
          .rawInsert(sqlInsertMovie, [1, movie['name'], movie['fav']]);
    }
    for (var character in user['favCharacters']) {
      await DB().db!.rawInsert(
          sqlInsertCharacter, [1, character['name'], character['fav']]);
    }
  }
}
