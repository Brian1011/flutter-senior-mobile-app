import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/order/data/order.dart';
import 'package:test_app/order/service/order_service.dart';
import 'package:test_app/utils/buttons_util.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({Key key}) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController pickupPointController = TextEditingController();
  TextEditingController dropPointController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController deliveryInstructionsController =
      TextEditingController();

  onSubmit() async {
    if (isFormValid()) {
      //Navigator.of(context).pushNamed("/verification");
      Order order = Order(
          pickUpAddress: pickupPointController.text,
          dropOffAddress: dropPointController.text,
          weight: weightController.text,
          deliveryInstructions: deliveryInstructionsController.text);
      await orderService.saveOrder(order);
      Fluttertoast.showToast(msg: "Order added successfully");
      // pop
      // Navigator.of(context).pushReplacementNamed("/orders");
    }
  }

  isFormValid() {
    if (formKey.currentState.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu),
                        Spacer(),
                      ],
                    ),
                    Text(
                      "Fill Below to Order",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Pickup Point"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: pickupPointController,
                      decoration: InputDecoration(
                        hintText: "The address, Waiyaki way",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter pickup point";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Drop-off Point"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: dropPointController,
                      decoration: InputDecoration(
                        hintText: "Ngong road, Lavington",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter drop point";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Est. Weight (KGs)"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "28.73",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Delivery Instructions"),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: deliveryInstructionsController,
                      decoration: InputDecoration(
                        hintText: "Call me on 072343224",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextButton(
                          onPressed: onSubmit,
                          child: Text("Confirm & order & trip"),
                          style: primaryButtonStyle),
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
