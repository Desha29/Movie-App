import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLdb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String dbpath = await getDatabasesPath();
    String dbname = join(dbpath, 'movie.db');
    Database db = await openDatabase(dbname,
        version: 6, onCreate: onCreate, onUpgrade: onUpgrade);
    return db;
  }

  onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgrade==================================");
  }

  onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE MOVIES(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          moviename TEXT NOT NULL,
          movieimage TEXT,
          movietrating TEXT NOT NULL,
          moviestoryline TEXT NOT NULL,
          length TEXT NOT NULL,
          language TEXT NOT NULL,
          rating TEXT NOT NULL, 
          year TEXT NOT NULL, 
          type TEXT NOT NULL,
          moviestars TEXT NOT NULL, 
          actorone TEXT, 
          actortwo TEXT,
          actorthree TEXT,
          actorfour TEXT,
          actorfive TEXT
        )''');
    print("onCreated==================================");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> movies = await mydb!.rawQuery(sql);
    return movies;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}

//  CREATE TABLE Movies (
//   id INTEGER PRIMARY KEY AUTOINCREMENT,
