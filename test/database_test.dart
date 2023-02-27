import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/database_helper.dart';

class MockDatabase extends Mock implements DatabaseHelper {}

main() {
  final database = MockDatabase();

  group("database connection", () {
    test('should not connect to database if connection is not established',
        () async {
      when(database.isConnected()).thenAnswer((_) => false);
      bool result = database.isConnected();
      expect(result, false);
    });

    test('should connect to database and if connection is established',
        () async {
      when(database.isConnected()).thenAnswer((_) => true);
      await database.connectDatabase();
      bool result = database.isConnected();
      expect(result, true);
    });
  });

  group("adapter registration", () {
    test('beans should be null if not registered', () async {
      expect(database.featureBean, isNull);
      expect(database.featureBean, isNull);
    });

    test('beans should be null if connection is not set', () async {
      expect(database.featureBean, isNull);
      expect(database.featureBean, isNull);
    });
  });
}
