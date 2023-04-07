import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../My_validation.dart';
import 'login_services.dart';

class LoginFormManager with MyValidation {
  late LoginFormService newPasswordFormService = LoginFormService();
  ApiService? apiService;
  LoginFormManager({this.apiService});

  ///email
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  ///password
  final _password = BehaviorSubject<String>();
  // final _hasValue = BehaviorSubject<bool>();

  Stream<String> get password$ => _password.stream.transform(passwordLength);
  Sink<String> get inPassword => _password.sink;


  ///Object
  Stream<bool> get isLoginFormValid$ =>
      CombineLatestStream([email$, password$], (values) => true);

  ///is Login Form Submit
  Stream<bool> get isLoginFormSubmit$ async* {
    String message = 'success';
    yield await newPasswordFormService.loginSubmitForm(
        _email.value, _password.value);
  }
}
