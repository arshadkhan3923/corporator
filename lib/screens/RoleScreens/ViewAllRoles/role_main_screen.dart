import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../responsive.dart';
import 'roles_data_table_screen.dart';
import 'dashboard_big_text_widgets.dart';
class RolesMainScreen extends StatelessWidget {
  const RolesMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MyFiles(),
              if (!Responsive.isMobile(context))
                const DashboardBigTextWidgets(title: 'Roles'),
              const SizedBox(height: defaultPadding),
              const RolesDataTable(),
              if (Responsive.isMobile(context))
                const SizedBox(height: defaultPadding),
            ],
          ),
        ),
        if (!Responsive.isMobile(context))
          const SizedBox(width: defaultPadding),
      ],
    );
  }
}
