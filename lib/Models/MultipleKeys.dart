import 'package:flutter/widgets.dart';

class MultipleKeys {
  static final loginFormKey = new Key('__login__');
  static final signUpFormKey = new Key('__sign_up__');
  GlobalKey _scaffoldKey = new GlobalKey();
   GlobalKey get scaffoldKey => _scaffoldKey;
}
