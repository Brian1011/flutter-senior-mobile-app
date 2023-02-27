import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/order/data/order.dart';
import 'package:test_app/order/service/order_service.dart';

class ListOrdersScreen extends StatefulWidget {
  const ListOrdersScreen({Key key}) : super(key: key);

  @override
  State<ListOrdersScreen> createState() => _ListOrdersScreenState();
}

class _ListOrdersScreenState extends State<ListOrdersScreen> {
  addNewOrder() {
    Navigator.of(context).pushNamed("/add-order");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            Consumer<OrderService>(builder: (context, orderService, _) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: orderService.orders.length,
                      itemBuilder: (context, index) {
                        Order order = orderService.orders[index];
                        return Container(
                          color:
                              index % 2 == 0 ? Colors.blue[200] : Colors.white,
                          child: Column(
                            children: [
                              RecordView(
                                title: "Order ID",
                                subtitle: order.id.toString(),
                              ),
                              RecordView(
                                title: "Pickup Address",
                                subtitle: order.pickUpAddress,
                              ),
                              RecordView(
                                title: "Weight",
                                subtitle: order.weight,
                              ),
                              RecordView(
                                title: "Drop off address",
                                subtitle: order.dropOffAddress,
                              ),
                              RecordView(
                                title: "Instructions",
                                subtitle: order.deliveryInstructions,
                              ),
                            ],
                          ),
                        );
                      }));
            })
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewOrder();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class RecordView extends StatelessWidget {
  final String title;
  final String subtitle;
  const RecordView({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "$title :",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
