
import 'package:baby_info/db_baby/baby_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBBaby extends GetxService {
  late Database dbBase;

  Future<DBBaby> init() async {
    await createBabyDB();
    return this;
  }

  createBabyDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'baby.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createBabyTable(db);
        });
  }

  createBabyTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS baby (id INTEGER PRIMARY KEY, createdTime TEXT, photo BLOB, name TEXT, birthday TEXT, sex INTEGER, height TEXT, weight TEXT, head TEXT)');
  }

  insertBaby(BabyEntity entity) async {
    final id = await dbBase.insert('baby', {
      'createdTime': entity.createdTime.toIso8601String(),
      'photo': entity.photo,
      'name': entity.name,
      'birthday': entity.birthday.toIso8601String(),
      'sex': entity.sex,
      'height': entity.height,
      'weight': entity.weight,
      'head': entity.head,
    });
    return id;
  }

  updateBaby(BabyEntity entity) async {
    await dbBase.update('baby', {
      'createdTime': entity.createdTime.toIso8601String(),
      'photo': entity.photo,
      'name': entity.name,
      'birthday': entity.birthday.toIso8601String(),
      'sex': entity.sex,
      'height': entity.height,
      'weight': entity.weight,
      'head': entity.head,
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanBabyData() async {
    await dbBase.delete('Baby');
  }

  Future<BabyEntity?> getBabyData() async {
    final List<Map<String, dynamic>> maps = await dbBase.query('baby');
    return maps.isEmpty ? null : BabyEntity.fromJson(maps.first);
  }
}
