import 'package:corporator/screens/PackagesScreen/AllPackage/view_package_services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'package_data_table_model.dart';

class ViewPackageManager with MyValidation {
  late ViewPackageService viewPackageService = ViewPackageService();
  ApiService? apiService;

  ViewPackageManager({this.apiService});
  final BehaviorSubject<List<ViewPackageModel>> _main =
  BehaviorSubject<List<ViewPackageModel>>();

  Stream<List<ViewPackageModel>> get mainList async* {
    ViewPackageService viewPackageService =
    ViewPackageService();
    yield await viewPackageService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}
}