import 'package:rxdart/rxdart.dart';
import '../../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'add_new_user_services.dart';

class AddNewUserManager with MyValidation {
  late AddNewUserService addNewUserService = AddNewUserService();
  ApiService? apiService;
  AddNewUserManager({this.apiService});

  /// user address
  final _userAddress = BehaviorSubject<String>();
  Stream<String> get userAddress$ => _userAddress.stream.transform(addressAppNewUserLength);
  Sink<String> get inUserAddress => _userAddress.sink;

  /// User phone number
  final _phoneNumber = BehaviorSubject<String>();
  Stream<String> get phoneNumber$ => _phoneNumber.stream.transform(phoneNumberNewUserLength);
  Sink<String> get inPhoneNumber => _phoneNumber.sink;

  /// User Zip Code
  final _userZipCode = BehaviorSubject<String>();
  Stream<String> get userZipCode$ => _userZipCode.stream.transform(zipCodeAppNewUserLength);
  Sink<String> get inUserZipCode => _userZipCode.sink;

  /// User Purpose
  final _userPurpose = BehaviorSubject<String>();
  Stream<String> get userPurpose$ => _userPurpose.stream.transform(purposeAppNewUserLength);
  Sink<String> get inUserPurpose => _userPurpose.sink;

  ///owen id
  final _ownerId = BehaviorSubject<String>();
  Stream<String> get ownerId$ => _ownerId.stream.transform(appNewUserOwenIdLength);
  Sink<String> get inOwnerId => _ownerId.sink;


  ///Object
  Stream<bool> get isFormAddNewUserValid$ =>
      CombineLatestStream([
        userAddress$,
        phoneNumber$,
        userZipCode$,
        userPurpose$,
        ownerId$,
      ], (values) => true);

  ///is User Form Submit
  Stream<bool> get isFormAddNewUserSubmit$ async* {
    String message = 'success';
    yield await addNewUserService.addNewFormUserSubmit(
       _userAddress.value,
       _phoneNumber.value,
       _userZipCode.value,
       _userPurpose.value,
       _ownerId.value,
    );
  }
}
