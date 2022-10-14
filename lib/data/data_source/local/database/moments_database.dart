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
    return openDatabase(path,
        version: 10, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future<void> _onCreate(Database database, int version) async {
    const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const String booleanType = 'BOOLEAN NOT NULL';
    const String integerType = 'INTEGER NOT NULL';
    const String textType = 'TEXT NOT NULL';

    await database.execute('''
  CREATE TABLE $MOMENTS_TABLE (
  ${MomentsFields.id} $idType,
  ${MomentsFields.apiId} $textType,
  ${MomentsFields.title} $textType,
  ${MomentsFields.description} $textType,
  ${MomentsFields.videoPath} $textType,
  ${MomentsFields.dateTime} $textType,
  ${MomentsFields.favourite} $booleanType,
  ${MomentsFields.mentalHealth} $booleanType,
  ${MomentsFields.fulfillment} $booleanType,
  ${MomentsFields.awareness} $booleanType,
  ${MomentsFields.joy} $booleanType,
  ${MomentsFields.habit} $booleanType,
  ${MomentsFields.goal} $booleanType,
  ${MomentsFields.improvement} $booleanType,
  ${MomentsFields.discovering} $booleanType,
  ${MomentsFields.relationship} $booleanType
  )''');
  }

  Future<void> _onUpgrade(
      Database database, int oldVersion, int newVersion) async {}

  Future<void> insertMoment(Moment moment) async {
    final Database database = await instance.database;
    await database.insert(MOMENTS_TABLE, moment.toJson());
  }

  Future<void> insertMoments(List<Moment> moments) async {
    final Database database = await instance.database;
    final Batch batch = database.batch();
    moments.forEach((Moment moment) {
      batch.insert(MOMENTS_TABLE, moment.toJson());
    });
    await batch.commit();
  }

  Future<Moment> readMoment(String apiId) async {
    final Database database = await instance.database;

    final List<Map<String, Object?>> maps = await database.query(MOMENTS_TABLE,
        columns: MomentsFields.values,
        where: '${MomentsFields.apiId} = ?',
        whereArgs: <Object>[apiId]);

    if (maps != null && maps.isNotEmpty) {
      return Moment.fromJson(maps.first);
    } else {
      throw Exception('Moment with $apiId not found');
    }
  }

  Future<Moment?> readLastMoment() async {
    final Database database = await instance.database;

    final List<Map<String, Object?>> maps = await database.query(MOMENTS_TABLE,
        columns: MomentsFields.values, limit: 1);

    if (maps != null && maps.isNotEmpty) {
      return Moment.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Moment>> readMoments() async {
    final Database database = await instance.database;
    final String orderBy = '${MomentsFields.dateTime} DESC';

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
        where: '${MomentsFields.apiId} = ?', whereArgs: <Object>[moment.apiId]);
  }

  Future<int> deleteMoment(int apiId) async {
    final Database database = await instance.database;

    return database.delete(MOMENTS_TABLE,
        where: '${MomentsFields.apiId} = ?', whereArgs: <Object>[apiId]);
  }

  Future<void> close() async {
    final Database database = await instance.database;
    database.close();
  }
}
