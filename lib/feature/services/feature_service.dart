import 'package:flutter/widgets.dart';
import 'package:test_app/database_helper.dart';
import 'package:test_app/feature/data/feature_model.dart';

FeatureService featureService = FeatureService();

class FeatureService extends ChangeNotifier {
  List<FeatureModel> features = [];

  init() async {
    getAllFeatures();
  }

  getAllFeatures() async {
    try {
      features = await db.featureBean.getAll();
      notifyListeners();
    } catch (e) {
      return throw e;
    }
  }

  addNewFeature({FeatureModel feature}) async {
    await db.featureBean.insert(feature);
    getAllFeatures();
  }

  updateFeature({FeatureModel feature}) async {
    await db.featureBean.update(feature);
    getAllFeatures();
  }

  deleteFeature({FeatureModel feature}) async {
    await db.featureBean.remove(feature.id);
    getAllFeatures();
  }
}
