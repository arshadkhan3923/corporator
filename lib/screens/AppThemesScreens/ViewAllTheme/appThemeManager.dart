


import 'package:rxdart/rxdart.dart';

import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'appThemeServices.dart';
import 'app_theme_data_table_model.dart';

class AppThemeManager with MyValidation {
  late AppThemeService appThemeService = AppThemeService();
  ApiService? apiService;

  AppThemeManager({this.apiService});
  final BehaviorSubject<List<AppThemeModel>> _main =
  BehaviorSubject<List<AppThemeModel>>();

  Stream<List<AppThemeModel>> get mainList async* {
    AppThemeService appThemeService = AppThemeService();
    yield await appThemeService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));}
}