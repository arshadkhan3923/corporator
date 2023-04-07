import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../My_validation.dart';
import 'forget_password_services.dart';

class ForgetPasswordManager with MyValidation {
  late ForgetPasswordService forgetPasswordService = ForgetPasswordService();
  ApiService? apiService;
  ForgetPasswordManager({this.apiService});

  ///email
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(forgetPasswordValidate);
  Sink<String> get inEmail => _email.sink;


  ///Object
  Stream<bool> get isForgetPasswordValid$ =>
      CombineLatestStream([email$,], (values) => true);

  ///is Forget Email Submit
  Stream<bool> get isForgetPasswordSubmit$ async* {
    yield await forgetPasswordService.forgetPasswordSubmitForm(
        _email.value,);
  }
}
