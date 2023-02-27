import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_app/utils/buttons_util.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  onSubmit() {
    if (isFormValid()) {
      Navigator.of(context).pushNamed("/otp");
    }
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
                        "Enter verification code to confirm your number",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PinCodeTextField(
                          controller: otpController,
                          appContext: context,
                          obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter OTP";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          length: 4),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextButton(
                            onPressed: onSubmit,
                            child: Text("Validate and continue >"),
                            style: primaryButtonStyle),
                      )
                    ],
                  )),
                  Container(
                    height: 40,
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
