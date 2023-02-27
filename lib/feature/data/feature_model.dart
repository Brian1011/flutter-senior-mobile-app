import 'package:jaguar_orm/jaguar_orm.dart';

class FeatureModel {
  @PrimaryKey(auto: true)
  int id;
  @Column(isNullable: true)
  String name;

  FeatureModel({this.id, this.name});
}
