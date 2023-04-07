import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'add_new_package_services.dart';

class AddNewPackageManager with MyValidation {
  late AddNewPackageService addNewPackageService = AddNewPackageService();
  ApiService? apiService;
  AddNewPackageManager({this.apiService});

  /// new package name
  final _name = BehaviorSubject<String>();
  Stream<String> get name$ => _name.stream.transform(nameNewPackageLength);
  Sink<String> get inName => _name.sink;

  /// add new package quota
  final _quota = BehaviorSubject<String>();
  Stream<String> get quota$ => _quota.stream.transform(quotaNewPackageLength);
  Sink<String> get inQuota => _quota.sink;

  /// new package price
  final _price = BehaviorSubject<String>();
  Stream<String> get price$ => _price.stream.transform(priceNewPackageLength);
  Sink<String> get inPrice => _price.sink;

  /// new package duration
  final _duration = BehaviorSubject<String>();
  Stream<String> get duration$ => _duration.stream.transform(durationNewPackageLength);
  Sink<String> get inDuration => _duration.sink;

  ///owen id
  final _ownerId = BehaviorSubject<String>();
  Stream<String> get ownerId$ => _ownerId.stream.transform(owenIdNewPackageLength);
  Sink<String> get inOwnerId => _ownerId.sink;


  ///Object
  Stream<bool> get isFormAddNewPackageValid$ =>
      CombineLatestStream([
        name$,
        quota$,
        price$,
        duration$,
        ownerId$,
      ], (values) => true);

  ///is User Form Submit
  Stream<bool> get isFormAddNewPackageSubmit$ async* {
    yield await addNewPackageService.addNewFormPackageSubmit(
      _name.value,
      _quota.value,
      _price.value,
      _duration.value,
      _ownerId.value,
    );
  }
}
