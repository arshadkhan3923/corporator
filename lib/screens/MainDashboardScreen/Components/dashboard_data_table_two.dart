import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../RoleScreens/ViewAllRoles/dashboard_text_widgets.dart';

class DashboardUserDataTable extends StatelessWidget {
  final List<Map<String, String>> data = [
    {"id": "01", "name": "John Mosley", "type": "single","":"" },
    {"id": "02", "name": "Olive Yew", "type": "single", },
    {"id": "03", "name": "Teri Dactyl", "type": "Married", },


  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(columnSpacing: MediaQuery.of(context).size.width*0.1,
      columns: [
        DataColumn(
          label: Row(children: const [
            DashboardTextWidgets(title: 'Id'),
            Icon(
              Icons.arrow_drop_down,
              color: AppColors.grayColors,
            ),
          ]),
        ),
        DataColumn(
          label: Row(children: const [
            DashboardTextWidgets(title: 'Name'),
            Icon(
              Icons.arrow_drop_down,
              color: AppColors.grayColors,
            ),
          ]),
        ),
        DataColumn(
          label: Row(children: const [
            DashboardTextWidgets(title: 'Type'),
            Icon(
              Icons.arrow_drop_down,
              color: AppColors.grayColors,
            ),
          ]),
        ),
      ],
      rows: data
          .map(
            (e) => DataRow(cells: [
          DataCell(Text(e["id"]!,
            style: TextStyle(
              color: AppColors.textColors,
            ),
          ),
          ),
          DataCell(Text(
            e["name"]!,
            style: TextStyle(
              color: AppColors.textColors,
            ),
          )),
          DataCell(Text(e["type"]!,
            style: TextStyle(
              color: AppColors.textColors,
            ),
          ),
          ),
        ]),
      ).toList(),
    );
  }
}
