import 'package:corporator/screens/Auth/VerifyForgetPassword/verify_password_services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../My_validation.dart';

class VerifyForgetPasswordManager with MyValidation {
  late VerifyForgetPasswordService verifyForgetPasswordService = VerifyForgetPasswordService();
  ApiService? apiService;
  VerifyForgetPasswordManager({this.apiService});

  ///email
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  ///code
  final _code = BehaviorSubject<String>();
  Stream<String> get code$ => _code.stream.transform(verifyForgetCodeValidate);
  Sink<String> get inCode => _code.sink;

  ///Object
  Stream<bool> get isVerifyForgetPasswordValid$ =>
      CombineLatestStream([email$,code$], (values) => true);

  ///is Forget Email Submit
  Stream<bool> get isVerifyForgetPasswordSubmit$ async* {
    yield await verifyForgetPasswordService.verifyForgetPasswordSubmitForm(
      _email.value,
      _code.value,
    );
  }
}
