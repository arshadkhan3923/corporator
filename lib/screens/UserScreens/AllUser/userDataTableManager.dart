import 'package:corporator/screens/UserScreens/AllUser/user_data_services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'user_data_table_model.dart';


class UserDataTableManager with MyValidation {
  late UserDataTableService userDataTableService = UserDataTableService();
  ApiService? apiService;

  UserDataTableManager({this.apiService});
  final BehaviorSubject<List<UserModel>> _main =
  BehaviorSubject<List<UserModel>>();

  Stream<List<UserModel>> get mainList async* {
    UserDataTableService userDataTableService =
    UserDataTableService();
    yield await userDataTableService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}
}