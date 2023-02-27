import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/feature/data/feature_bean.dart';

DatabaseHelper db = DatabaseHelper();

class DatabaseHelper {
  static DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();
  SqfliteAdapter _adapter;
  FeatureBean featureBean;

  init() async {
    try {
      await connectDatabase();
      await registerDatabaseAdapters();
    } catch (e) {
      print(e);
    }
  }

  connectDatabase() async {
    var dbPath = await getDatabasesPath();
    _adapter = new SqfliteAdapter(dbPath + '/test.db', version: 1);
    await _adapter.connect();
  }

  bool isConnected() {
    return _adapter.connection != null;
  }

  registerDatabaseAdapters() async {
    featureBean = new FeatureBean(_adapter);
    await featureBean.createTable(ifNotExists: true);
  }
}
