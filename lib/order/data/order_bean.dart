import 'package:jaguar_orm/jaguar_orm.dart';

import 'order.dart';

part 'order_bean.jorm.dart';

@GenBean()
class OrderBean extends Bean<Order> with _OrderBean {
  final String tableName = 'orders';
  OrderBean(Adapter adapter) : super(adapter);
}
