import 'package:flutter/material.dart';
import 'package:test_app/auth/services/auth_service.dart';
import 'package:test_app/utils/buttons_util.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  bool loading = false;

  onSubmit() async {
    if (isFormValid()) {
      setLoader(true);
      await authService.sendOTPtoNumber(
          phoneNumber: phoneNumberController.text);
      setLoader(false);
      Navigator.of(context).pushNamed("/verification",
          arguments: {'phoneNumber': phoneNumberController.text});
    }
  }

  setLoader(bool value) {
    setState(() {
      loading = value;
    });
  }

  isFormValid() {
    if (formKey.currentState.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void previous() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.2,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "Enter Your Phone Number to Join Amitruck",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        // apply border
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // apply border
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("254"),
                              ),
                            ),
                            Container(
                              // apply left border
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter phone number",
                                      labelText: "Enter phone number"),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Phone number cannot be empty";
                                    }
                                    if (value.length < 10) {
                                      return "Phone number has to be more than 10 characters";
                                    }
                                    return null;
                                  }),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: loading ? 60 : 40,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextButton(
                            onPressed: onSubmit,
                            child: loading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  )
                                : Text("Confirm and continue >"),
                            style: primaryButtonStyle),
                      )
                    ],
                  )),
                  Container(
                    height: 0,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextButton(
                        onPressed: previous,
                        child: Text("< Go back"),
                        style: secondaryButtonStyle),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
