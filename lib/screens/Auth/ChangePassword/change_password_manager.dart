import 'package:rxdart/rxdart.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../My_validation.dart';
import 'change_password_services.dart';

class ResetPasswordManager with MyValidation {
  late RestPasswordService restPasswordService = RestPasswordService();
  ApiService? apiService;
  ResetPasswordManager({this.apiService});


  ///change password
  final _password = BehaviorSubject<String>();
  Stream<String> get password$ => _password.stream.transform(restValidatePassword);
  Sink<String> get inPassword => _password.sink;

  ///Object
  Stream<bool> get isResetPasswordValid$ =>
      CombineLatestStream([password$], (values) => true);

  ///is Forget Email Submit
  Stream<bool> get isResetPasswordSubmit$ async* {
    yield await restPasswordService.resetPasswordSubmitForm(_password.value);
  }
}
