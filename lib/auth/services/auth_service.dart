import 'package:flutter/cupertino.dart';
import 'package:prefs/prefs.dart';

class AuthService extends ChangeNotifier {
  String _phoneNumber;
  String get phoneNumber => _phoneNumber;

  init() async {
    await Prefs.init();
    getPhoneNumber();
  }

  setPhoneNumber(String phoneNumber) {
    Prefs.setString("phoneNumber", phoneNumber);
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void getPhoneNumber() {
    _phoneNumber = Prefs.getString("phoneNumber");
    notifyListeners();
  }

  // call api
  Future<bool> sendOTPtoNumber({String phoneNumber}) async {
    Future.delayed(Duration(seconds: 2));
    return true;
  }

  // mock api call
  Future<bool> verifyOTP({String phoneNumber, String code}) async {
    await Future.delayed(Duration(seconds: 2));
    await setPhoneNumber(phoneNumber);
    return true;
  }
}
