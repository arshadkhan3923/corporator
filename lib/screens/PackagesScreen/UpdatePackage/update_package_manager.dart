import 'package:corporator/screens/PackagesScreen/UpdatePackage/update_packages_services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';

class UpdatePackageManager with MyValidation {
  late UpdatePackageService updatePackageService = UpdatePackageService();
  ApiService? apiService;
  UpdatePackageManager({this.apiService});

  ///Name
  final _name = BehaviorSubject<String>();
  Stream<String> get name$ => _name.stream.transform(namePackageLength);
  Sink<String> get inName => _name.sink;

  ///Quota
  final _quota = BehaviorSubject<String>();
  Stream<String> get quota$ => _quota.stream.transform(quotaPackageLength);
  Sink<String> get inQuota => _quota.sink;

  ///Price
  final _price = BehaviorSubject<String>();
  Stream<String> get price$ => _price.stream.transform(pricePackageLength);
  Sink<String> get inPrice => _price.sink;

  ///Duration
  final _duration = BehaviorSubject<String>();
  Stream<String> get duration$ => _duration.stream.transform(durationPackageLength);
  Sink<String> get inDuration => _duration.sink;


  ///Object
  Stream<bool> get isPackageFormValid$ =>
      CombineLatestStream([name$,quota$,price$,duration$], (values) => true);

  ///is Login Form Submit
  Stream<bool> get isPackageFormSubmit$ async* {
    yield await updatePackageService.updatePackageSubmitForm(
        _name.value,
        _quota.value,
        _price.value,
        _duration.value,

    );
  }
}
