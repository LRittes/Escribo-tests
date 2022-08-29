import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DB {
  static final DB _instance = DB._privateConstructor();
  static Database? db;

  DB._privateConstructor();

  factory DB() {
    return _instance;
  }

  get database async {
    if (db != null) return db;

    return await openDB();
  }

  Future<Database> openDB() async {
    return await openDatabase(
      p.join(await getDatabasesPath(), "dbuser.db"),
      version: 1,
      onCreate: onCreate,
    );
  }

  Future<void> onCreate(Database db, int version) async {
    db.execute('PRAGMA foreign_keys = ON;');
    db.execute('''CREATE TABLE user (
                      id INTEGER PRIMARY KEY,
  	                  avatar varchar(50)
                  );''');
    db.execute('''create table favMovies (
  	                  name Text,
  	                  fav bool,
	                    idMovie Integer,
  	                  FOREIGN key (idMovie)
  		                  REFERENCES user (id)
  	                  ON UPDATE CASCADE
                      ON DELETE CASCADE
                  );''');
    db.execute('''create table favCharacters (
  	                  name Text,
  	                  fav bool,
	                    idCharacter Integer,
  	                  FOREIGN key (idCharacter)
		                    REFERENCES user (id)
	                    ON UPDATE CASCADE
                      ON DELETE CASCADE
  		
                  );''');
  }
}
