import '../../../screens/Auth/login/login_manager.dart';
import '../../screens/AppThemesScreens/Add_Theme/add_new_theme_manager.dart';
import '../../screens/AppThemesScreens/UpdateThemes/update_theme_manager.dart';
import '../../screens/AppThemesScreens/ViewAllTheme/appThemeManager.dart';
import '../../screens/Auth/ChangePassword/change_password_manager.dart';
import '../../screens/Auth/ForgetPassword/forget_password_manager.dart';
import '../../screens/Auth/VerifyForgetPassword/verify_password_manager.dart';
import '../../screens/PackagesScreen/AddNewPackage/add_new_package_manager.dart';
import '../../screens/PackagesScreen/AllPackage/viewPackageManager.dart';
import '../../screens/PackagesScreen/UpdatePackage/update_package_manager.dart';
import '../../screens/UserScreens/AddNewUser/add_new_User_manager.dart';
import '../../screens/UserScreens/AllUser/userDataTableManager.dart';
import '../../screens/UserScreens/UpdateUserScreen/userUpdate_manager.dart';

class Overseer {

  Map<dynamic, dynamic> repository = {};
  static String statusCode="";
  static String updatePackageId="";


  // register managers
  Overseer() {
    register(LoginFormManager, LoginFormManager());
    register(ForgetPasswordManager, ForgetPasswordManager());
    register(VerifyForgetPasswordManager, VerifyForgetPasswordManager());
    register(ResetPasswordManager, ResetPasswordManager());
    register(UserDataTableManager, UserDataTableManager());
    register(AppThemeManager, AppThemeManager());
    register(AddNewThemeManager, AddNewThemeManager());
    register(UpdateThemeManager, UpdateThemeManager());
    register(ViewPackageManager, ViewPackageManager());
    register(AddNewPackageManager, AddNewPackageManager());
    register(UpdatePackageManager, UpdatePackageManager());
    register(AddNewUserManager, AddNewUserManager());
    register(UpdateUserManager, UpdateUserManager());

  }

  // register the manager to this overseer to store in repository
  register(name, object) {
    repository[name] = object;
  }

  // get the required manager from overseer when needed
  fetch(name) {
    return repository[name];
  }
}