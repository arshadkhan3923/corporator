import 'package:corporator/screens/UserScreens/AllUser/userDataTableManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../../../utils/app_colors.dart';
import '../UpdateUserScreen/update_user_screen.dart';
import 'user_data_table_model.dart';

class UserDataTable extends StatelessWidget {
   UserDataTable({
    Key? key,
  }) : super(key: key);
late int id;
  @override
  Widget build(BuildContext context) {
    UserDataTableManager userDataTableManager =
    Provider.of(context).fetch(UserDataTableManager);
    return Container(
      height: 1000.h,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColors,
        borderRadius:  BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Observer<List<UserModel>>(
        stream: userDataTableManager.mainList,
        onSuccess: (context,snapshot){
          List<UserModel>? data =snapshot;
          UserModel modelData =data![0];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
             ShowEntryAndSearch(number: "${modelData.data!.length}"),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      horizontalMargin: 0,
                      columnSpacing:MediaQuery.of(context).size.width*.1,
                      columns:  [
                        DataColumn(
                          label: Row(
                            children: [
                              SizedBox(width: 15.w,),
                              Text("ID",
                                style: TextStyle(
                                    color: AppColors.grayColors,
                                    fontSize: 22.sp
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,size: 22.sp,color: AppColors.grayColors,),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Name",
                              style: TextStyle(
                                color: AppColors.grayColors,
                                fontSize: 22.sp
                              ),
                              ),
                              Icon(Icons.arrow_drop_down,size: 22.sp, color: AppColors.grayColors,),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Email",
                              style: TextStyle(
                                color: AppColors.grayColors,
                                fontSize: 22.sp
                              ),
                              ),
                              Icon(Icons.arrow_drop_down,size: 22.sp, color: AppColors.grayColors,),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Created Date",
                              style: TextStyle(
                                color: AppColors.grayColors,
                                fontSize: 22.sp
                              ),
                              ),
                              Icon(Icons.arrow_drop_down,size: 22.sp, color: AppColors.grayColors,),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Text("Action",
                            style: TextStyle(
                              color: AppColors.grayColors,
                              fontSize: 22.sp
                          ),
                          ),
                        ),
                      ],
                      rows: List.generate(
                        modelData.data!.length,
                        (index) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                  child: Text(modelData.data![index].id.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data![index].name.toString(),
                                  style: TextStyle(
                                    color: AppColors.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data![index].email.toString(),
                                  style: TextStyle(
                                    color: AppColors.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(modelData.data![index].createdAt.substring(0,10).toString(),
                                  style: TextStyle(
                                    color: AppColors.textColors,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                               DataCell(
                                  UpdateUserScreen(
                                    id: modelData.data![index].id,
                                  name: modelData.data![index].name,
                                  email: modelData.data![index].email,
                                  password: modelData.data![index].updatedAt.substring(0,10),
                                  role: modelData.data![index].createdAt.substring(0,10),
                                  ),
                              ),
                            ],
                          );
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        }
        ,onWaiting: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
      },
        onError: (context,error){
          return const Text("Check Your Internet");
        },
      ),
    );
  }
}
