import 'package:flutter/material.dart';
import 'package:test_app/utils/buttons_util.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  onSubmit() {
    Navigator.of(context).pushNamed("/register");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to AmiTruck Driver",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "A simple, reliable logistics app",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                  ],
                )),
                Spacer(),
                Text("Terms and conditions apply"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextButton(
                      onPressed: onSubmit,
                      child: Text("Accept T&C and Continue"),
                      style: primaryButtonStyle),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
