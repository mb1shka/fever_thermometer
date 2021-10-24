import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:temperature/model/measurement_fields.dart';


class TemperatureDataBase {
  static final TemperatureDataBase instance = TemperatureDataBase.init();

  static Database? _database;

  TemperatureDataBase.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('measurement.sqlite');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const intType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableMeasurements (
    ${MeasurementFields.temperature} $intType,
    ${MeasurementFields.degree} $textType,
    ${MeasurementFields.health} $textType,
    ${MeasurementFields.symptoms} $textType,
    ${MeasurementFields.notes} $textType,
    ${MeasurementFields.dateTime} $intType
    )
    ''');
  }

  Future<Measurement> create(Measurement measurement) async {
    final db = await instance.database;
    final jsonMeasurement = measurement.toJson();
    await db.insert(tableMeasurements, jsonMeasurement);
    return measurement.copy();
  }

  Future<List<Measurement>> readAll([DateTime? timestamp]) async {
    final db = await instance.database;
    String? where;
    List? whereArgs;

    if (timestamp != null) {
      where = "dateTime >= ?";
      whereArgs = [timestamp.toUtc().millisecondsSinceEpoch];
    }

    //DEC == reversed, с конца
    final orderBy = '${MeasurementFields.dateTime} DESC';
    //WhereArgs
    final result = await db.query(tableMeasurements, orderBy: orderBy, where: where, whereArgs: whereArgs);

    return result.map((json) => Measurement.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}