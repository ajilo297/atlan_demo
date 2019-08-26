import 'package:atlan_demo/core/base/base_service.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService extends BaseService {
  static const _ROOM_TABLE = 'ROOM';
  static const _APPLICANCE_TABLE = 'APPLICANCE';

  static const _ID_KEY = 'ID';
  static const _ROOM_ID_KEY = 'ROOM_ID';
  static const _NAME_KEY = 'NAME';
  static const _IS_ON_KEY = 'IS_ON';
  static const _CREATED_AT_KEY = 'CREATED_AT';
  static const _UPDATED_AT_KEY = 'UPDATED_AT';

  Database _database;

  DatabaseService() {
    initialize();
  }

  Future initialize() async {
    _database = await openDatabase(
      'happ_db.db',
      onCreate: (database, version) async {
        await createDatabase(database);
      },
      version: 1,
    );
  }

  Future closeDb() async {
    _database.close();
  }

  Future createDatabase(Database database) async {
    log.i('createDatabase');

    String createRoomQuery = 'CREATE TABLE $_ROOM_TABLE ('
        '$_ID_KEY INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$_NAME_KEY TEXT'
        ')';
    log.d('createDatabase: $createRoomQuery');
    database.execute(createRoomQuery);

    String createApplianceQuery = 'CREATE TABLE $_APPLICANCE_TABLE ('
        '$_ID_KEY INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$_ROOM_ID_KEY INTEGER, '
        '$_NAME_KEY TEXT, '
        '$_IS_ON_KEY INTEGER, '
        '$_CREATED_AT_KEY INTEGER, '
        '$_UPDATED_AT_KEY INTEGER'
        ')';
    log.d('createApplianceQuery: $createApplianceQuery');
    database.execute(createApplianceQuery);


  }
}