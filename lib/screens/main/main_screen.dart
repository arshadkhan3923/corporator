import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppThemesScreens/Add_Theme/add_new_theme.dart';
import '../AppThemesScreens/ViewAllTheme/app_themes_main_screen.dart';
import '../PackagesScreen/AddNewPackage/add_new_package_screen.dart';
import '../UserScreens/AddNewUser/add_new_user_screen.dart';
import 'Tab_update_provider.dart';
import '../../constants.dart';
import '../../controllers/MenuController.dart';
import '../../responsive.dart';
import '../../utils/app_colors.dart';
import '../DownloadActivityScreen/Component/download_activity_main_screen.dart';
import '../MainDashboardScreen/Components/dashboard_main_screen.dart';
import '../MemoryQuotaScreen/AllMemoryQuota/memory_quota_main_screen.dart';
import '../PackagesScreen/AllPackage/view_packages_main_screen.dart';
import '../RoleScreens/ViewAllRoles/header.dart';
import '../RoleScreens/ViewAllRoles/role_main_screen.dart';
import '../SettingsScreens/Components/setting_main_screen.dart';
import '../UploadActivityScreens/UploadActivity/upload_mctivity_main_screen.dart';
import '../UserPackagesScreen/AllUserPackage/user_package_main_screen.dart';
import '../UserScreens/AllUser/user_main_screen.dart';
import '../VendoresScreen/AllVendors/vendors_main_screen.dart';
import '../WorkspaceScreens/AllWorkSpace/workspace_main_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
   MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
   int k = 0;
  final List<Widget> listWidget = [
    const DashboardMainScreen(),
    const RolesMainScreen(),
    const UserMainScreen(),
    const AddUserDataScreen(),
    const VendorsManiScreen(),
    const PackagesMainScreen(),
    const AddPackageDataScreen(),
    const MemoryQuotaMainScreen(),
    const AppThemesMainScreen(),
     AddThemeDataScreen(),
    const WorkSpaceMainScreen(),
    const UserPackageMainScreen(),
    const DownloadActivityMainScreen(),
    const UploadActivityMainScreen(),
    const SettingsMainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UpdateIndex>(context);
    // TODO
    return Scaffold(
      backgroundColor: AppColors.adminBgColors,
      key: context.read<MenuController2>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
               const Expanded(
                child: SideMenu(),
              ),
             Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Header(),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: listWidget[user.index],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
