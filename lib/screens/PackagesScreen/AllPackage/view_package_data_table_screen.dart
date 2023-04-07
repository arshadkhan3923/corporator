import 'package:corporator/screens/PackagesScreen/AllPackage/viewPackageManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../Widgets/sow_entry_and_search_widgets.dart';
import '../../../utils/app_colors.dart';
import '../UpdatePackage/uptate_package_screen.dart';
import 'package_data_table_model.dart';

class PackageDataTable extends StatelessWidget {
  const PackageDataTable({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ViewPackageManager viewPackageManager =
    Provider.of(context).fetch(ViewPackageManager);
    return Container(
      height: 1000.h,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.whiteColors,
        borderRadius:  BorderRadius.all(Radius.circular(10.r)),
      ),
      child: SingleChildScrollView(
        child: Observer<List<ViewPackageModel>>(
          stream: viewPackageManager.mainList,
          onSuccess: (context,snapshot){
            List<ViewPackageModel>? data =snapshot;
            ViewPackageModel modelData =data![0];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  ShowEntryAndSearch(number: "${modelData.data.length}"),
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
                                    Text("Quota",
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
                                    Text("Price",
                                      style: TextStyle(
                                          color: AppColors.grayColors,
                                          fontSize: 22.sp
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 22.sp,
                                      color: AppColors.grayColors,
                                    ),
                                  ],
                                ),
                              ),
                              DataColumn(
                                label: Row(
                                  children: [
                                    Text("Duration",
                                      style: TextStyle(
                                          color: AppColors.grayColors,
                                          fontSize: 22.sp
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
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
                                        Text(modelData.data[index].name.toString(),
                                          style: TextStyle(
                                            color: AppColors.textColors,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(modelData.data[index].quota.toString(),
                                          style: TextStyle(
                                            color: AppColors.textColors,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(modelData.data[index].price.toString(),
                                          style: TextStyle(
                                            color: AppColors.textColors,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(modelData.data[index].duration.toString(),
                                          style: TextStyle(
                                            color: AppColors.textColors,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                          UpdatePackageScreen(
                                              id: modelData.data[index].id,
                                              name: modelData.data[index].name,
                                              price: modelData.data[index].quota,
                                              quota: modelData.data[index].price,
                                              duration:modelData.data[index].duration,
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
              ),
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
      )
    );
  }
}


