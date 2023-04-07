import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
class SecondChartWidgets extends StatefulWidget {
  const SecondChartWidgets({Key? key}) : super(key: key);

  @override
  State<SecondChartWidgets> createState() => _SecondChartWidgetsState();
}

class _SecondChartWidgetsState extends State<SecondChartWidgets> {
  @override
  Widget build(BuildContext context) {
    return Sparkline(
      fallbackHeight: 230.h,
      fallbackWidth: 453.w,
      data: const [
        -1.5, 1 - 0, 2 - 4,
        -1.5, .1, .2, 2.3,
        -2.3,-1.5,-1.3,1.3,
        -2.3,1-5,1.1,-1,
      ],
      // backgroundColor: Colors.red,
      lineColor: Colors.lightGreen[500]!,
      fillMode: FillMode.below,
      fillColor: Colors.green.withOpacity(.3),
      pointsMode: PointsMode.all,
      pointSize: 8.0,
      pointColor: AppColors.bgColors,
      useCubicSmoothing: true,
      lineWidth: 1.0,
      gridLinelabelPrefix: '\$',
      gridLineLabelPrecision: 3,
      enableGridLines: false,
      averageLine: false,
      averageLabel: true,
      kLine: ['max', 'min', 'first', 'last'],
      // max: 50.5,
      // min: 10.0,
      enableThreshold: true,
      thresholdSize: 0.1,
      lineGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.bgColors, AppColors.bgColors],
      ),
      fillGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff1D1D41), Color(0xff627EC600)],
      ),
    );
  }
}
