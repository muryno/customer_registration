import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import 'model/Registrations.dart';

class DBHelper with ChangeNotifier {
  static final tableName = 'userable';
  sql.Database db;

  DBHelper() {
    // this will run when provider is instantiate the first time
    init();
  }

  void init() async {
    final dbPath = await sql.getDatabasesPath();
    db = await sql.openDatabase(
      path.join(dbPath, 'myegistration.db'),
      onCreate: (db, version) {

      return   db.execute(
            'CREATE TABLE  IF NOT EXISTS  Test (id INTEGER PRIMARY KEY autoincrement, first_name TEXT, last_name TEXT, email TEXT,imei TEXT,picturepath TEXT,lat TEXT,lon TEXT,dobirth TEXT,device TEXT)');
      },
      version: 1,
    );
    // the init funciton is async so it won't block the main thread
    // notify provider that depends on it when done
    notifyListeners();
  }

   insert(Map<String, dynamic> person) async {
   return  await db.insert('Test',   person , conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }



  /// CRUD OPERATION
  Future<List<Map<String, dynamic>>> getData(String table) async {
    return await db.query(table);
  }

  updatePerson(Registrations person) async {
    var response = await db.update('Test', person.toJson(),
        where: "id = ?", whereArgs: [person.id]);
    return response;
  }

  Future<Registrations> getPersonWithId(int id) async {
    var response = await db.query('Test', where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Registrations.fromJson(response.first) : null;
  }

  Future<List<Registrations>> getAllPersons() async {
    var response = await db.query('Test');
    List<Registrations> list = response.map((c) => Registrations.fromJson(c)).toList();
    return list;
  }

  deletePersonWithId(int id) async {
    return db.delete('Test', where: "id = ?", whereArgs: [id]);
  }

  deleteAllPersons() async {
    db.delete('Test');
  }
}
