import 'package:cardsearch/data/database/database_querybuilder.dart';
import 'package:cardsearch/data/database/database_service.dart';
import 'package:cardsearch/data/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserTable extends BaseTable {
  UserTable(String tableName) : super(tableName);

  // batch insertion
  void batchInsert() {
    List<Map<String, dynamic>> userList = [];
    for (int i = 1; i <= 100; i++) {
      Map<String, dynamic> user = {
        "name": 'Micromerger' + i.toString(),
        "country": "Pakistan",
        "city": "Rawalpindi",
        'cnic': '${i}8494-8284849-$i',
        "address": "Micromerger I-9",
        "age": i.toString(),
        "updatedDate": (DateTime.now().millisecondsSinceEpoch),
        "createdDate": (DateTime.now().millisecondsSinceEpoch)
      };
      userList.add(user);
    }
    _batchInsert(userList);
  }

  Future<List<User>> getAllUsers() async {
    List<Map<String, dynamic>> allUsers = List.from(await _fetchAllRecords());
    return allUsers.map<User>((e) {
      e = Map.from(e);
      e.remove('id');
      return User.fromJson(e);
    }).toList();

    // for (var user in allUsers) {
    //   user.remove('id');
    //   User userj = User.fromJson(Map<String, dynamic>.from(user));
    //   allUserj.add(userj);
    // }
    // return allUserj;
  }
}

// base table
class BaseTable {
  String? _tableName;
  BaseTable(String table) {
    _tableName = table;
  }

  void _batchInsert(List<Map<String, dynamic>> userList) async {
    try {
      Database? db = await DatabaseService.instance.database;
      Batch batch = db!.batch();
      for (Map<String, dynamic> data in userList) {
        batch.insert(_tableName!, data);
      }
      await batch.commit(noResult: true);
    } catch (e) {
      throw Exception(e);
    }
  }

  // insert  records
  Future<int> _insert(Map<String, dynamic> data) async {
    String queryBuilt = QueryBuilder.insertQueryBuilder(data);
    try {
      Database? db = await DatabaseService.instance.database;
      String sql = 'INSERT INTO $_tableName $queryBuilt';
      int id = await db!.rawInsert(sql);
      return id;
    } catch (e) {
      throw Exception(e);
    }
  }

  // update the record
  Future<int> _update(Map<String, dynamic> data) async {
    Database? db = await DatabaseService.instance.database;
    List values = data.values.toList();
    String subSet = QueryBuilder.updateRecordQueryBuilder(data);
    String sql = 'UPDATE $_tableName SET $subSet WHERE id = ?';
    int updateCount = await db!.rawUpdate(sql, [...values, values.first]);
    return updateCount;
  }

  // fetch all records
  Future<List<Map<String, dynamic>>> _fetchAllRecords() async {
    try {
      Database? db = await DatabaseService.instance.database;
      String sql = 'SELECT * FROM $_tableName ORDER BY createdDate DESC';
      return await db!.rawQuery(sql);
    } catch (e) {
      throw Exception(e);
    }
  }

  // fetch single record
  Future<List<Map<String, Object?>>> _fetchSingleRecord(int userId) async {
    try {
      Database? db = await DatabaseService.instance.database;
      String sql = 'SELECT * FROM $_tableName WHERE id = $userId';
      return await db!.rawQuery(sql);
    } catch (e) {
      throw Exception(e);
    }
  }
}
