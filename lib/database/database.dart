import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Database? _database;

  Future<Database> connect() async => await openDatabase(join(await getDatabasesPath(), "solar_monitoring.db"), version: 1, onCreate: _createDatabase);

  Future<Database?> get database async => _database??await connect();

  insertData(table, data) async => await (await database)?.insert(table, data);

  readData(table) async => await (await database)?.query(table);

  readDataById(table, itemId) async => await (await database)?.query(table, where: 'id=?', whereArgs: [itemId]);

  updateData(table, data) async => await (await database)?.update(table, data, where: 'id=?', whereArgs: [data['id']]);

  deleteDataById(table, itemId) async => await (await database)?.rawDelete("delete from $table where id=$itemId");

  //initialise the database
  Future<void> _createDatabase(Database db, int version) async {
    db.execute('CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER);');
  }
}
