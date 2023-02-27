import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/database_helper.dart';
import 'package:test_app/feature/data/feature_model.dart';
import 'package:test_app/feature/services/feature_service.dart';

class MockFeatureService extends Mock implements FeatureService {}

class MockDatabase extends Mock implements DatabaseHelper {}

main() {
  final mockDatabase = MockDatabase();
  final mockFeatureService = MockFeatureService();

  group("service crud operations", () {
    test('features list should be empty if database is not connected',
        () async {
      when((mockFeatureService.features)).thenAnswer((_) => []);
      List<FeatureModel> result = mockFeatureService.features;
      expect(result.length, 0);
    });

    test('features list should not be empty if database is connected',
        () async {
      when((mockFeatureService.features)).thenAnswer((_) => [FeatureModel()]);
      List<FeatureModel> result = mockFeatureService.features;
      expect(result.length, 1);
    });

    test('should add new feature if database is connected', () async {
      await mockDatabase.init();
      when(await mockFeatureService.addNewFeature(feature: FeatureModel()))
          .thenAnswer((_) => null);
      expect(await mockFeatureService.addNewFeature(feature: FeatureModel()),
          isInstanceOf<void>());
    });

    test('should update feature if database is connected', () async {
      await mockDatabase.init();
      when(await mockFeatureService.updateFeature(feature: FeatureModel()))
          .thenAnswer((_) => null);
      expect(await mockFeatureService.updateFeature(feature: FeatureModel()),
          isInstanceOf<void>());
    });

    test('should delete feature if database is connected', () async {
      await mockDatabase.init();
      when(await mockFeatureService.deleteFeature(feature: FeatureModel()))
          .thenAnswer((_) => null);
      expect(await mockFeatureService.deleteFeature(feature: FeatureModel()),
          isInstanceOf<void>());
    });
  });
}
