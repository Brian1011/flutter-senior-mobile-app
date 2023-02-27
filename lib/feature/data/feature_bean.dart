import 'package:jaguar_orm/jaguar_orm.dart';

import 'feature_model.dart';

part 'feature_bean.jorm.dart';

@GenBean()
class FeatureBean extends Bean<FeatureModel> with _FeatureBean {
  final String tableName = 'features';
  FeatureBean(Adapter adapter) : super(adapter);
}
