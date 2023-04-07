import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';


class BarChartUsers extends StatelessWidget {
  const BarChartUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 564.w,
      height: 320.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColors,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: BarChart(BarChartData(
            borderData: FlBorderData(border: Border.all(width: 0)),
            barGroups: [
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(
                    y: 10,
                    width: 19.w,
                    colors: [AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(
                    y: 3,
                    width: 19.w,
                    colors: [AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(
                    y: 12.r,
                    width: 19,
                    colors: [AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(
                    y: 8,
                    width: 19,
                    colors: [AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(
                    y: 6,
                    width: 19,
                    colors: [AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(
                    y: 10,
                    width: 19,
                    colors: [AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 7, barRods: [
                BarChartRodData(
                    y: 13,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(
                    y: 6,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 9, barRods: [
                BarChartRodData(
                    y: 4,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(
                    y: 9,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 11, barRods: [
                BarChartRodData(
                    y: 7,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 12, barRods: [
                BarChartRodData(
                    y: 2.r,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 13, barRods: [
                BarChartRodData(
                    y: 6,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 14, barRods: [
                BarChartRodData(
                    y: 13,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 14, barRods: [
                BarChartRodData(
                    y: 10,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
              BarChartGroupData(x: 14, barRods: [
                BarChartRodData(
                    y: 8,
                    width: 19,
                    colors: [        AppColors.bgColors],
                    borderRadius: BorderRadius.circular(2.r)
                )
              ]),
            ]),
        ),
      )
    );
  }
}
