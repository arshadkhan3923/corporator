import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../../../utils/app_colors.dart';
import '../UpdateThemes/update_theme_screen.dart';
import 'app_theme_data_table_model.dart';
import 'appThemeManager.dart';

class AppThemeDataTable extends StatelessWidget {
  const AppThemeDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeManager appThemeManager =
    Provider.of(context).fetch(AppThemeManager);
    return Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: AppColors.whiteColors,
          borderRadius:  BorderRadius.all(Radius.circular(10.r)),
        ),
        child: SingleChildScrollView(
          child: Observer<List<AppThemeModel>>(
            stream: appThemeManager.mainList,
            onSuccess: (context,snapshot){
              List<AppThemeModel>? data =snapshot;
              AppThemeModel modelData =data![0];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  ShowEntryAndSearch(number:"${modelData.data.length}"),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
                      horizontalMargin: 0,
                      columnSpacing:MediaQuery.of(context).size.width*.020,
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
                              Icon(Icons.arrow_drop_down,
                                size: 22.sp,
                                color: AppColors.grayColors,
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Logo",
                                style: TextStyle(
                                    color: AppColors.grayColors,
                                    fontSize: 22.sp
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                size: 22.sp,
                                color: AppColors.grayColors,
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Bg",
                                style: TextStyle(
                                    color: AppColors.grayColors,
                                    fontSize: 22.sp
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                size: 22.sp,
                                color: AppColors.grayColors,
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("White",
                                style: TextStyle(
                                    color: AppColors.grayColors,
                                    fontSize: 22.sp
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                size: 22.sp,
                                color: AppColors.grayColors,
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("D_Gray",
                                style: TextStyle(
                                    color: AppColors.grayColors,
                                    fontSize: 22.sp
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                size: 22.sp,
                                color: AppColors.grayColors,
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Gray",
                                style: TextStyle(
                                    color: AppColors.grayColors,
                                    fontSize: 22.sp
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                size: 22.sp,
                                color: AppColors.grayColors,
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            children: [
                              Text("Text",
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
                              Text("Link",
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
                              Text("Primary",
                                style: TextStyle(
                                    color: AppColors.grayColors,
                                    fontSize: 22.sp
                                ),
                              ),
                              Icon(Icons.arrow_drop_down,
                                size: 22.sp,
                                color: AppColors.grayColors,
                              ),
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
                          modelData.data.length,
                              (index) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                    child: Text(modelData.data[index].ownerId.toString(),
                                      style: TextStyle(
                                        color: AppColors.textColors,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ClipOval(
                                        child: CircleAvatar(
                                          radius: 50.r,
                                          backgroundImage: const AssetImage("assets/images/profile.png"),
                                        ),
                                      ),
                                    ),
                                ),
                                DataCell(
                                  Text(modelData.data[index].bg.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(modelData.data[index].white.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(modelData.data[index].DGray.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(modelData.data[index].Grey.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(modelData.data[index].Text.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(modelData.data[index].link.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(modelData.data[index].Primary.toString(),
                                    style: TextStyle(
                                      color: AppColors.textColors,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  UpdateThemeScreen(
                                    id: modelData.data[index].id,
                                    primaryColor: modelData.data[index].Primary,
                                    dGrayColor: modelData.data[index].DGray,
                                    text: modelData.data[index].Text,
                                    link: modelData.data[index].link,
                                    ownerId: modelData.data[index].ownerId,
                                    white: modelData.data[index].white,
                                    bgColor:modelData.data[index].bg,
                                    gray: modelData.data[index].Grey,
                                  ),
                                ),
                              ],
                            );
                          }
                      ),
                    ),
                  ),
                ],
              );
            },
            onWaiting: (context){
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
            onError: (context,error){
              return const Text("Check Your Internet");
            },
          ),
        ),
    );
  }
}







