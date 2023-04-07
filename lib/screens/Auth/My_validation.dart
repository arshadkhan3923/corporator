import 'dart:async';

import 'package:flutter/foundation.dart';

mixin MyValidation {
  //TODO: Login
  static bool isEmail(String email) => email.contains('@');
  static bool isPasswordValidLength(String password) => password.length >= 5;

  //TODO: Forget Password
  static bool isForgetPassword(String email) => email.contains('@');
  static bool  isVerifyCodeLength(String text) => text.length == 6;
  static bool  isRestLength(String text) => text.length >= 8;

//TODO: Add new Theme
  static bool  isPrimaryAppNewThemeLength(String text) => text.length >= 3;
  static bool  isBgColorAppNewThemeLength(String text) => text.length >= 3;
  static bool  isTextAppNewThemeLength(String text) => text.length >= 3;
  static bool  isGrayAppNewThemeLength(String text) => text.length >= 3;
  static bool  isDGrayAppNewThemeLength(String text) => text.length >= 3;
  static bool  isWhiteAppNewThemeLength(String text) => text.length >= 3;
  static bool  isLinkAppNewThemeLength(String text) => text.length >= 3;
  static bool isAppNewThemeOwenIdLength(String owenId) => owenId.isNotEmpty;
  static bool isAppNewThemeImageLength(String file) => file.isNotEmpty;
///
  //TODO: Update Theme
  static bool isBGColorUpdateThemeLength(String text) => text.length>=2;
  static bool  isWhiteUpdateThemeLength(String text) => text.length >= 2;
  static bool isDGrayUpdateThemeLength(String text) => text.length>=2;
  static bool isGrayUpdateThemeLength(String text) => text.length>= 2;
  static bool  isTitleUpdateThemeLength(String text) => text.length >=2;
  static bool isLinkUpdateThemeLength(String text) => text.length>=2;
  static bool  isPrimaryUpdateThemeLength(String text) => text.length >=2;
  static bool isUpdateThemeOwenIdLength(String owenId) => owenId.isNotEmpty;
///
  //TODO: Add new Package
  static bool  isAddNewPackageNameLength(String text) => text.length >= 4;
  static bool  isAddNewPackageQuotaLength(String text) => text.length >= 4;
  static bool  isAddNewPackagePriceLength(String text) => text.length >= 5;
  static bool isAddNewPackageDurationLength(String text) => text.length >3;
  static bool isAddNewPackageOwnerIdLength(String owenId) => owenId.isNotEmpty;

  //TODO: Update Package
  static bool  isPackageNameLength(String text) => text.length >= 3;
  static bool  isPackageQuotaLength(String text) => text.length >= 2;
  static bool  isPackagePriceLength(String text) => text.length >= 2;
  static bool isPackageDurationLength(String text) => text.length >2;


  // TODO: ADD NEW USER
  static bool  isAddressAppNewUserLength(String text) => text.length >= 5;
  static bool  isPhoneNumberAppNewUserLength(String text) => text.length == 11;
  static bool  isZipCodeAppNewUserLength(String text) => text.length >= 4;
  static bool  isPurposeAppNewUserLength(String text) => text.length >= 4;
  static bool isAppNewUserOwenIdLength(String owenId) => owenId.isNotEmpty;

  ///TODO:UPDATE USER

   static bool  isUpdateUserNameLength(String text) => text.length >= 2;
  static bool  isUpdateUserEmailLength(String email) => email.contains('@');
   static bool  isUpdateUserPasswordLength(String text) => text.length >= 4;
   static bool  isUpdateUserRoleLength(String text) => text.length >= 2;

  ///
  ///
  //TODO: Login screen
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("getting text $value 1");
      sink.add(value);
    } else {
      print("getting error text $value 2");
      sink.add("");
      sink.addError("field error");
    }
  });
///
  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPasswordValidLength(value)) {
      sink.add(value);
    } else {
      print("password error text > $value");
      sink.add("");
      sink.addError("Password must be of 6 characters");
    }
  });
///
  //TODO: Forget Password
  final forgetPasswordValidate =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isForgetPassword(value)) {
      if (kDebugMode) {
        print("getting text $value");
      }
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("getting error text $value");
      }
      sink.add("");
      sink.addError("Enter valid email");
    }
  });
///
//TODO: Verify  password code
  final verifyForgetCodeValidate =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isVerifyCodeLength(value)) {
      print("getting text $value");
      sink.add(value);
    } else {
      print("getting error text $value");
      sink.add("");
      sink.addError("Enter valid code");
    }
  });
///
  //TODO: Forget Password
  final restValidatePassword =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isRestLength(value)) {
      print("getting text $value");
      sink.add(value);
    } else {
      print("getting error text $value");
      sink.add("");
      sink.addError("Password must be greater then 8 character");
    }
  });
///
//TODO: Add new Theme
  final primaryAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPrimaryAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final bgAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isBgColorAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final textAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isTextAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final whiteAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isWhiteAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final dGrayAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isDGrayAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final grayAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isGrayAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  final linkAppNewThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isLinkAppNewThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final appNewThemeOwenIdLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAppNewThemeOwenIdLength(value)) {
      sink.add(value);
    } else {
      print("OwenId > $value");
      sink.add("");
      sink.addError("Required Integer");
    }
  });
  ///
  // final appNewThemeImageLength =
  // StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
  //   if (isAppNewThemeImageLength(value)) {
  //     sink.add(value);
  //   } else {
  //     print("Theme Image > $value");
  //     sink.add("");
  //     sink.addError("Enter Your Image");
  //   }
  // });
  ///
  /// Update Theme
  final bgUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isBGColorUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final whiteUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isWhiteUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Theme > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final dGrayUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isDGrayUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      print("DGray > $value");
      sink.add("");
      sink.addError("Required DGray Colors");
    }
  });
  ///
  final grayUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isGrayUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New gray Colors > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final textUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isTitleUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Text > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final linkUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isLinkUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      print("Enter Link> $value");
      sink.add("");
      sink.addError("Required Colors");
    }
  });
  ///
  final primaryUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPrimaryUpdateThemeLength(value)) {
      sink.add(value);
    } else {
      print(" Add New primary Colors > $value");
      sink.add("");
      sink.addError("Enter valid data");
    }
  });
  ///
  final owenIdUpdateThemeLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateThemeOwenIdLength(value)) {
      sink.add(value);
    } else {
      print("OwenId > $value");
      sink.add("");
      sink.addError("Required Integer");
    }
  });
  ///

//TODO: Add new User
  final addressAppNewUserLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddressAppNewUserLength(value)) {
      sink.add(value);
    } else {
      print(" Add New User > $value");
      sink.add("");
      sink.addError("Enter your address");
    }
  });
///
  final phoneNumberNewUserLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPhoneNumberAppNewUserLength(value)) {
      sink.add(value);
    } else {
      print(" Add New User > $value");
      sink.add("");
      sink.addError("Enter your phone");
    }
  });
///
  final zipCodeAppNewUserLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isZipCodeAppNewUserLength(value)) {
      sink.add(value);
    } else {
      print(" Add New User > $value");
      sink.add("");
      sink.addError("Enter Your ZipCode");
    }
  });
///
  final purposeAppNewUserLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPurposeAppNewUserLength(value)) {
      sink.add(value);
    } else {
      print(" Add New User > $value");
      sink.add("");
      sink.addError("Enter your purpose");
    }
  });
 ///
  final appNewUserOwenIdLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAppNewUserOwenIdLength(value)) {
      sink.add(value);
    } else {
      print("OwenId > $value");
      sink.add("");
      sink.addError("Required Integer");
    }
  });
///

  //TODO: UPDATE USER
  final appUpdateUserNameLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateUserNameLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Name > $value");
      }
      sink.add("");
      sink.addError("Enter valid Name");
    }
  });
///
  final updateUserEmailLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateUserEmailLength(value)) {
      sink.add(value);
    } else {
      print("User Email > $value");
      sink.add("");
      sink.addError("Required Email");
    }
  });
///
  final appUpdateUserPasswordLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateUserPasswordLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("User Password > $value");
      }
      sink.add("");
      sink.addError("Enter valid password");
    }
  });
///
  final appUpdateUserRoleLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isUpdateUserRoleLength(value)) {
      sink.add(value);
    } else {
      print("user Role > $value");
      sink.add("");
      sink.addError("Required Role");
    }
  });
///

  //TODO: Add new Package
  final nameNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackageNameLength(value)) {
      sink.add(value);
    } else {
      print(" Add New User > $value");
      sink.add("");
      sink.addError("Enter your Name");
    }
  });
///
  final quotaNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackageQuotaLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Package > $value");
      sink.add("");
      sink.addError("Enter your Quota");
    }
  });
///
  final priceNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackagePriceLength(value)) {
      sink.add(value);
    } else {
      print(" Add New Package > $value");
      sink.add("");
      sink.addError("Enter Your Price");
    }
  });
///
  final durationNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackageDurationLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print(" Add New Package > $value");
      }
      sink.add("");
      sink.addError("Enter your Duration");
    }
  });
///
  final owenIdNewPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isAddNewPackageOwnerIdLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("OwenId > $value");
      }
      sink.add("");
      sink.addError("Required Integer");
    }
  });
///
  ///TODO: Update Package
  final namePackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPackageNameLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("name > $value");
      }
      sink.add("");
      sink.addError("Required Name");
    }
  });
///
  final quotaPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPackageQuotaLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("quota > $value");
      }
      sink.add("");
      sink.addError("Required quota");
    }
  });
///
  final pricePackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPackagePriceLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Price > $value");
      }
      sink.add("");
      sink.addError("Required Price");
    }
  });
///
  final durationPackageLength =
  StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPackageDurationLength(value)) {
      sink.add(value);
    } else {
      if (kDebugMode) {
        print("Duration > $value");
      }
      sink.add("");
      sink.addError("Required Duration");
    }
  });
///

}

