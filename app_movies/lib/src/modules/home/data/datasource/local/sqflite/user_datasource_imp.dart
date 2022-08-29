import 'dart:io';
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
    final user = await DB().database.rawQuery("$sqlSelectAll user");
    if (user.isNotEmpty) {
      final favMovies = await DB().database.rawQuery("$sqlSelectAll favMovies");
      final favCharacters =
          await DB().database.rawQuery("$sqlSelectAll favCharacters");

      return {
        "avatar": "${user[0]['avatar']}",
        "favMovies": favMovies,
        "favCharacters": favCharacters,
      };
    }
    File file = File('app_movies/assets/images/default.txt');
    String avatar = await file.readAsString();
    return {
      "avatar": avatar,
      "favMovies": [],
      "favCharacters": [],
    };
  }

  @override
  Future<void> saveUser(Map<String, dynamic> user) async {
    await DB().database.rawDelete(sqlDeleteUser, [1]);
    await DB().database.rawInsert(sqlInsertUser, [1, user['avatar']]);
    for (var movie in user['favMovies']) {
      await DB()
          .database
          .rawInsert(sqlInsertMovie, [1, movie['name'], movie['fav']]);
    }
    for (var character in user['favCharacters']) {
      await DB().database.rawInsert(
        sqlInsertCharacter,
        [1, character['name'], character['fav']],
      );
    }
  }
}
