import 'package:discovery_app/misc/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: 1.sw,
            height: 0.07.sh,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/logo.png")),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    'About Us',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  )
                ],
              ),
            ),
          ),
          DataTable(dataRowHeight: 100, columnSpacing: 24, columns: const [
            DataColumn(
              label: Text(
                'MSSV',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: SizedBox(
                  width: 120,
                  child: Text('Sinh viên',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
            DataColumn(
              label: Text('Nhiệm vụ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ], rows: [
            DataRow(
                color: MaterialStateProperty.all(
                    AppConstants.backgroundColor2.withOpacity(0.1)),
                cells: [
                  DataCell(Text('20183618')),
                  DataCell(Text('Nguyễn Thắng Quyết')),
                  DataCell(Text('Crawl - Clean data, xây dựng UI, FE, Chat bot')),
                ]),
            DataRow(cells: [
              DataCell(Text('20183621')),
              DataCell(Text('Nguyễn Hoàng Sơn')),
              DataCell(
                  Text('Crawl - Clean data, phân tích use case, CSDL, BE')),
            ]),
            DataRow(
                color: MaterialStateProperty.all(
                    AppConstants.backgroundColor2.withOpacity(0.1)),
                cells: [
                  DataCell(Text('20183604')),
                  DataCell(Text('Đào Quốc Phong')),
                  DataCell(Text(
                      'Crawl - Clean data, phân tích dữ liệu, xây dựng model AI')),
                ]),
            DataRow(cells: [
              DataCell(Text('20183619')),
              DataCell(Text('Đặng Thái Sơn')),
              DataCell(
                  Text('Crawl - Clean data, Deploy Model - Edge Deployment, Chat bot')),
            ]),
          ])
        ],
      ),
    ));
  }
}
