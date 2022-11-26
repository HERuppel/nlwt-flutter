import 'package:flutter/material.dart';
import 'package:nlwt/shared/models/bill_model.dart';
import 'package:nlwt/shared/themes/app_colors.dart';
import 'package:nlwt/shared/themes/app_text_style.dart';
import 'package:nlwt/shared/widgets/bill_info/bill_info.dart';
import 'package:nlwt/shared/widgets/bill_list/bill_list.dart';
import 'package:nlwt/shared/widgets/bill_list/bill_list_controller.dart';

class MyBillsPage extends StatefulWidget {
  const MyBillsPage({super.key});

  @override
  State<MyBillsPage> createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<MyBillsPage> {
  final controller = BillListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BillModel>>(
                    valueListenable: controller.billsNotifier,
                    builder: (_, bills, __) => BillInfo(size: bills.length)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  "Meus Boletos",
                  style: TextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
              height: 1,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BillList(
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
