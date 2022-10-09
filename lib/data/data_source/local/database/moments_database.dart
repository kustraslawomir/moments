import 'package:sqflite/sqflite.dart';

import '../../../models/moment.dart';
import 'fields.dart';
import 'table.dart';

class MomentsDatabase {
  MomentsDatabase._init();

  static final MomentsDatabase instance = MomentsDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('moments.db');
    return _database!;
  }

  Future<Database> _initDB(String databaseName) async {
    final String databasePath = await getDatabasesPath();
    final String path = '$databasePath$databaseName';
    print("init database: $path");
    return openDatabase(path,
        version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<void> _onCreate(Database database, int version) async {
    const String idType = 'INTEGER PRIMARY KEY';
    const String booleanType = 'BOOLEAN NOT NULL';
    const String integerType = 'INTEGER NOT NULL';
    const String textType = 'TEXT NOT NULL';

    await database.execute('''
  CREATE TABLE $MOMENTS_TABLE (
  ${MomentsFields.id} $idType,
  ${MomentsFields.favourite} $booleanType,
  ${MomentsFields.title} $textType,
  ${MomentsFields.description} $textType,
  ${MomentsFields.videoPath} $textType,
  ${MomentsFields.dateTime} $textType
  )''');
  }

  Future<void> _onUpgrade(
      Database database, int oldVersion, int newVersion) async {}

  Future<Moment> create(Moment moment) async {
    final Database database = await instance.database;
    final int id = await database.insert(MOMENTS_TABLE, moment.toJson());
    return moment.copy(id: id);
  }

  Future<Moment> readMoment(int id) async {
    final Database database = await instance.database;

    final List<Map<String, Object?>> maps = await database.query(MOMENTS_TABLE,
        columns: MomentsFields.values,
        where: '${MomentsFields.id} = ?',
        whereArgs: <Object>[id]);

    if (maps != null && maps.isNotEmpty) {
      return Moment.fromJson(maps.first);
    } else {
      throw Exception('Moment with $id not found');
    }
  }

  Future<List<Moment>> readMoments() async {
    final Database database = await instance.database;
    final String orderBy = '${MomentsFields.dateTime} ASC';

    final List<Map<String, Object?>> maps = await database.query(MOMENTS_TABLE,
        columns: MomentsFields.values, orderBy: orderBy);

    if (maps != null && maps.isNotEmpty) {
      return maps
          .map((Map<String, Object?> element) => Moment.fromJson(element))
          .toList();
    } else {
      return <Moment>[];
    }
  }

  Future<int> updateMoment(Moment moment) async {
    final Database database = await instance.database;

    return database.update(MOMENTS_TABLE, moment.toJson(),
        where: '${MomentsFields.id} = ?', whereArgs: <Object>[moment.id]);
  }

  Future<int> deleteMoment(int id) async {
    final Database database = await instance.database;

    return database.delete(MOMENTS_TABLE,
        where: '${MomentsFields.id} = ?', whereArgs: <Object>[id]);
  }

  Future<void> close() async {
    final Database database = await instance.database;
    database.close();
  }
}
