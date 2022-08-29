import 'package:app_movies/src/modules/home/data/datasource/interface/user_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/local/sqflite/db.dart';
import 'package:app_movies/src/modules/home/data/datasource/local/sqflite/sql_commands.dart';

class UserDatasourceImp implements UserDatasource {
  @override
  Future<Map<String, dynamic>> getUser() async {
    final db = await DB().database;
    // await db.rawDelete(SQLDELETEUSER);
    // await db.rawDelete(SQLDELETEMOVIE);
    // await db.rawDelete(SQLDELETECHARACTER);

    final user = await db.rawQuery("$SQLSELECTALL user");
    if (user.isNotEmpty) {
      final favMovies = await db.rawQuery("$SQLSELECTALL favMovies");
      final favCharacters = await db.rawQuery("$SQLSELECTALL favCharacters");
      db.close();

      return {
        "avatar": "${user[0]['avatar']}",
        "favMovies": favMovies,
        "favCharacters": favCharacters,
      };
    }
    db.close();

    return {
      "avatar": "avatar",
      "favMovies": [],
      "favCharacters": [],
    };
  }

  @override
  Future<void> saveUser(Map<String, dynamic> user) async {
    final db = await DB().database;

    await db.rawDelete(SQLDELETEUSER);
    await db.rawDelete(SQLDELETEMOVIE);
    await db.rawDelete(SQLDELETECHARACTER);

    await db.rawInsert(SQLINSERTUSER, [user['avatar']]);

    for (var movie in user['favMovies']) {
      await db.rawInsert(SQLINSERTMOVIE, [movie['name'], movie['fav']]);
    }
    for (var character in user['favCharacters']) {
      await db.rawInsert(
        SQLINSERTCHARACTER,
        [character['name'], character['fav']],
      );
    }
    db.close();
  }
}
