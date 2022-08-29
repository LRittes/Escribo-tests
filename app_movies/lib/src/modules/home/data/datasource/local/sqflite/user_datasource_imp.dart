import 'package:app_movies/src/modules/home/data/datasource/interface/user_datasource.dart';
import 'package:app_movies/src/modules/home/data/datasource/local/sqflite/db.dart';

const String SQLSELECTALL = 'SELECT * FROM ';
const String SQLDELETEUSER = 'DELETE FROM user WHERE id = 1';
const String SQLINSERTUSER = 'INSERT INTO user (id, avatar) VALUES (1,?)';

const String SQLINSERTMOVIE =
    'INSERT INTO favMovies (idMovie, name, fav) VALUES (1,?,?)';
const String SQLDELETEMOVIE = 'DELETE FROM favMovies WHERE idMovie = 1';

const String SQLINSERTCHARACTER =
    'INSERT INTO favCharacters (idCharacter, name, fav) VALUES (1,?,?)';
const String SQLDELETECHARACTER =
    'DELETE FROM favCharacters WHERE idCharacter = 1';

class UserDatasourceImp implements UserDatasource {
  @override
  Future<Map<String, dynamic>> getUser() async {
    final db = await DB().database;
    // await db.rawDelete(SQLDELETEUSER);
    // await db.rawDelete(SQLDELETEMOVIE);
    // await db.rawDelete(SQLDELETECHARACTER);

    print('DB GET USER: ${await db.rawQuery("$SQLSELECTALL favMovies")}');
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

    print('DB SAVE USER : ${user['favMovies'][0]}');
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
