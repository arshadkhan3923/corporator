import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../../AppLayers/Networking/apis_services.dart';
import '../../Auth/My_validation.dart';
import 'add_newTheme_services.dart';

class AddNewThemeManager with MyValidation {
  late AddNewThemeService addNewThemeService = AddNewThemeService();
  ApiService? apiService;
  AddNewThemeManager({this.apiService});

  /// BG Colors
  final _bgColor = BehaviorSubject<String>();
  Stream<String> get bgColor$ => _bgColor.stream.transform(bgAppNewThemeLength);
  Sink<String> get inBgColor => _bgColor.sink;

  /// Text
  final _text = BehaviorSubject<String>();
  Stream<String> get text$ => _text.stream.transform(textAppNewThemeLength);
  Sink<String> get inText => _text.sink;

  /// White Colors
  final _white = BehaviorSubject<String>();
  Stream<String> get white$ => _white.stream.transform(whiteAppNewThemeLength);
  Sink<String> get inWhite => _white.sink;

  /// D_Gray Colors
  final _dGray = BehaviorSubject<String>();
  Stream<String> get dGray$ => _dGray.stream.transform(dGrayAppNewThemeLength);
  Sink<String> get inDGray => _dGray.sink;

  /// Gray Colors
  final _gray = BehaviorSubject<String>();
  Stream<String> get gray$ => _gray.stream.transform(grayAppNewThemeLength);
  Sink<String> get inGray => _gray.sink;

  /// Link
  final _link = BehaviorSubject<String>();
  Stream<String> get link$ => _link.stream.transform(linkAppNewThemeLength);
  Sink<String> get inLink => _link.sink;

  /// Primary Colors
  final _primaryColor = BehaviorSubject<String>();
  Stream<String> get primaryColor$ => _primaryColor.stream.transform(primaryAppNewThemeLength);
  Sink<String> get inPrimaryColor => _primaryColor.sink;

  ///owen id
  final _ownerId = BehaviorSubject<String>();
  Stream<String> get ownerId$ => _ownerId.stream.transform(appNewThemeOwenIdLength);
  Sink<String> get inOwnerId => _ownerId.sink;

  /// Theme Image
  // final _themeImage = BehaviorSubject<String>();
  // Stream<String> get themeImage$ => _themeImage.stream.transform(appNewThemeImageLength);
  // Sink<String> get inThemeImage => _themeImage.sink;

  ///Object
  Stream<bool> get isFormAddNewThemeValid$ =>
      CombineLatestStream([
        bgColor$,
        white$,
        dGray$,
        gray$,
        text$,
        link$,
        primaryColor$,
        ownerId$,
        // themeImage$,
      ],(values) => true);

  ///is Login Form Submit
  Stream<bool> get isFormAddNewThemeSubmit$ async* {
    String message = 'success';
    yield await addNewThemeService.addNewThemeFormSubmit(
      _bgColor.value,
      _white.value,
      _dGray.value,
      _gray.value,
      _text.value,
      _link.value,
      _primaryColor.value,
      _ownerId.value,
      // _themeImage.value,

    );
  }
}
