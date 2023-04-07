import 'package:corporator/screens/AppThemesScreens/UpdateThemes/update_theme_services.dart';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';

class UpdateThemeManager with MyValidation {
  late UpdateThemeService updateThemeService = UpdateThemeService();
  ApiService? apiService;
  UpdateThemeManager({this.apiService});

  /// DGray
  final _bgColor = BehaviorSubject<String>();
  Stream<String> get bgColors$ => _bgColor.stream.transform(bgUpdateThemeLength);
  Sink<String> get inBgColor => _bgColor.sink;

  ///color white
  final _white = BehaviorSubject<String>();
  Stream<String> get white$ => _white.stream.transform(whiteUpdateThemeLength);
  Sink<String> get inWhite => _white.sink;

  /// DGray Colors
  final _dGray = BehaviorSubject<String>();
  Stream<String> get dGray$ => _dGray.stream.transform(dGrayUpdateThemeLength);
  Sink<String> get inDGray => _dGray.sink;

  /// Gray
  final _gray = BehaviorSubject<String>();
  Stream<String> get gray$ => _gray.stream.transform(grayUpdateThemeLength);
  Sink<String> get inGray => _gray.sink;

  ///Text
  final _text = BehaviorSubject<String>();
  Stream<String> get text$ => _text.stream.transform(textUpdateThemeLength);
  Sink<String> get inText => _text.sink;

  /// Link
  final _link = BehaviorSubject<String>();
  Stream<String> get link$ => _link.stream.transform(linkUpdateThemeLength);
  Sink<String> get inLink => _link.sink;

  ///Colors Primary
  final _colorPrimary = BehaviorSubject<String>();
  Stream<String> get colorPrimary$ => _colorPrimary.stream.transform(primaryUpdateThemeLength);
  Sink<String> get inColorPrimary => _colorPrimary.sink;

  /// ownerId
  final _ownerId = BehaviorSubject<String>();
  Stream<String> get ownerId$ => _ownerId.stream.transform(owenIdUpdateThemeLength);
  Sink<String> get inOwner => _ownerId.sink;

  ///Object
  Stream<bool> get isUpdateThemeFormValid$ =>
      CombineLatestStream([
        bgColors$,
        white$,
        dGray$,
        gray$,
        text$,
        link$,
        colorPrimary$,
        ownerId$,
      ], (values) => true);
  ///is Login Form Submit
  Stream<bool> get isUpdateThemeFormSubmit$ async* {
    yield await updateThemeService.updateThemeSubmitForm(
      _bgColor.value,
      _white.value,
      _dGray.value,
      _text.value,
      _gray.value,
      _link.value,
      _colorPrimary.value,
      _ownerId.value,
    );
  }
}