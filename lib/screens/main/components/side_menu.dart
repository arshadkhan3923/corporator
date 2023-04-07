import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Tab_update_provider.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/expansion_tile_widgets.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);
  @override
  State<SideMenu> createState() => _SideMenuState();
}
class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: AppColors.bgColor,
      child: Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/admin_logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13.w,bottom: 10.h),
                child:Consumer<UpdateIndex>(
    builder: (context, provider, child) {
                 return InkWell(
                    onTap: (){
                    provider.indexUpdate(0);
                  },
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                      children: [
                        Image.asset('assets/icons/dashboard_icon.png'),
                        SizedBox(width: 15.w,),
                         Text('Dashboard',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.whiteColors,
                              ),
                           )
                      ],
                    ),
                  ),

                );
    }),
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                    return DrawerListExpansionTile(
                    title: 'Roles',
                    text: 'View All Roles',
                    text1: 'Add New Roles',
                    image: 'assets/icons/role_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(1);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(1);
                    },);
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'Users',
                    text: 'View All User',
                    text1: 'Add New User',
                    image: 'assets/icons/user_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(2);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(3);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'Vendors',
                    text: 'View All Vendors',
                    text1: 'Add New Vendors',
                    image: 'assets/icons/vendors_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(4);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(4);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'Packages',
                    text: 'View All Packages',
                    text1: 'Add New Packages',
                    image: 'assets/icons/packages_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(5);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(6);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'Memory Quota',
                    text: 'View Memory Quota',
                    text1: 'Add Memory Quota',
                    image: 'assets/icons/memory_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(7);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(7);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'App Theme',
                    text: 'View All Theme',
                    text1: 'Add New Theme',
                    image: 'assets/icons/sun_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(8);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(9);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'Workspaces',
                    text: 'View All Workspaces',
                    text1: 'Add New Workspaces',
                    image: 'assets/icons/workspaces_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(10);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(10);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'User Packages',
                    text: 'View All Packages',
                    text1: 'Add New Packages',
                    image: 'assets/icons/user_packages_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(11);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(11);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'Downloads',
                    text: 'View All Downloads',
                    text1: 'Add New Downloads',
                    image: 'assets/icons/downloads_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(12);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(12);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return DrawerListExpansionTile(
                    title: 'Uploads',
                    text: 'View All Uploads',
                    text1: 'Add New Uploads',
                    image: 'assets/icons/uploads_icon.png',
                    voidCallback1: (){
                      provider.indexUpdate(13);
                    },
                    voidCallback2: (){
                      provider.indexUpdate(13);
                    },
                  );
                }
              ),
              Consumer<UpdateIndex>(
                  builder: (context, provider, child) {
                  return InkWell(
                    onTap: (){
                      provider.indexUpdate(14);
                    },
                    child: SizedBox(
                      height: 50.h,
                      child: Row(
                        children: [
                          SizedBox(width: 16.w,height: 15.h,),
                          Image.asset(
                            'assets/icons/settings_icon.png',
                            color: AppColors.grayColors,
                          ),
                          SizedBox(width: 15.w,),
                          Text('Settings',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                          ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}