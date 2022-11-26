import 'package:flutter/material.dart';
import 'package:nlwt/shared/themes/app_colors.dart';
import 'package:nlwt/shared/themes/app_text_style.dart';
import 'package:nlwt/shared/widgets/bill_list/bill_list.dart';

class MyBillsPage extends StatefulWidget {
  const MyBillsPage({super.key});

  @override
  State<MyBillsPage> createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<MyBillsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Text(
            "Meus Boletos",
            style: TextStyles.titleBoldHeading,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            color: AppColors.stroke,
            height: 1,
            thickness: 1,
          ),
        ),
        const BillList()
      ],
    );
  }
}
