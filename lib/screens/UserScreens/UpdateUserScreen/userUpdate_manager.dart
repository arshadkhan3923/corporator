import 'package:corporator/screens/UserScreens/UpdateUserScreen/update_user_services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';

class UpdateUserManager with MyValidation {

  late UpdateUserService updateUserService = UpdateUserService();
  ApiService? apiService;
  UpdateUserManager({ this.apiService });

  ///Name
  final _name = BehaviorSubject < String >();
  Stream<String> get name$ => _name.stream.transform(appUpdateUserNameLength);
  Sink<String> get inName => _name.sink;

  ///Email
  final _email = BehaviorSubject < String >();
  Stream<String> get email$ => _email.stream.transform(updateUserEmailLength);
  Sink<String> get inEmail => _email.sink;

  ///Password
  final _password = BehaviorSubject < String >();
  Stream<String> get password$ => _password.stream.transform(appUpdateUserPasswordLength);
  Sink<String> get inPassword => _password.sink;

  ///Role
  final _role = BehaviorSubject < String >();
  Stream<String> get role$ => _role.stream.transform(appUpdateUserRoleLength);
  Sink<String> get inRole => _role.sink;

  ///Object
  Stream<bool> get isUserFormValid$ =>
      CombineLatestStream([name$, email$, password$, role$], (values) => true);

  ///is User Form Submit
  Stream<bool> get isUserFormSubmit$ async* {
    yield await updateUserService.updateUserSubmitForm(
      _name.value,
      _email.value,
      _password.value,
      _role.value,
    );
  }
}