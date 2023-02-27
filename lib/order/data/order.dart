import 'package:jaguar_orm/jaguar_orm.dart';

class Order {
  @PrimaryKey(auto: true)
  int id;
  @Column(isNullable: true)
  String pickUpAddress;
  @Column(isNullable: true)
  String dropOffAddress;
  @Column(isNullable: true)
  String weight;
  @Column(isNullable: true)
  String deliveryInstructions;

  Order({
    this.id,
    this.pickUpAddress,
    this.dropOffAddress,
    this.weight,
    this.deliveryInstructions,
  });

  // to string
  @override
  String toString() {
    return 'Order{id: $id, pickUpAddress: $pickUpAddress, dropOffAddress: $dropOffAddress, weight: $weight, deliveryInstructions: $deliveryInstructions}';
  }
}
