import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'model/Registrations.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "reg.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE Registrations(id INTEGER PRIMARY KEY autoincrement, firstName TEXT, email TEXT, dateOfBirth TEXT,"
                  " imei TEXT, lastName TEXT, dateOfBirth TEXT, picturePath TEXT"
                  ")");
        });
  }

  addPersonToDatabase(Registrations person) async {
    final db = await database;
    var raw = await db.insert(
      "Registrations",
      person.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  updatePerson(Registrations person) async {
    final db = await database;
    var response = await db.update("Registrations", person.toJson(),
        where: "id = ?", whereArgs: [person.id]);
    return response;
  }

  Future<Registrations> getPersonWithId(int id) async {
    final db = await database;
    var response = await db.query("Registrations", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? Registrations.fromJson(response.first) : null;
  }

  Future<List<Registrations>> getAllPersons() async {
    final db = await database;
    var response = await db.query("Registrations");
    List<Registrations> list = response.map((c) => Registrations.fromJson(c)).toList();
    return list;
  }

  deletePersonWithId(int id) async {
    final db = await database;
    return db.delete("Registrations", where: "id = ?", whereArgs: [id]);
  }

  deleteAllPersons() async {
    final db = await database;
    db.delete("Registrations");
  }
}