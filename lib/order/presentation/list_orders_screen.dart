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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
              child: Column(
            children: [
              Text(
                "List orders",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Expanded(
                child:
                    Consumer<OrderService>(builder: (context, orderService, _) {
                  return orderService.orders.length > 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(flex: 4, child: Container()),
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Center(
                                  child: Text(
                                      "No orders yet. Press on the add button"),
                                ),
                              ),
                            ),
                            Expanded(flex: 4, child: Container()),
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: orderService.orders.length,
                              itemBuilder: (context, index) {
                                Order order = orderService.orders[index];
                                return Card(
                                  child: Container(
                                    color: index % 2 == 0
                                        ? Colors.blue[100]
                                        : Colors.white,
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
                                  ),
                                );
                              }));
                }),
              )
            ],
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addNewOrder();
          },
          child: Icon(Icons.add),
        ),
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
