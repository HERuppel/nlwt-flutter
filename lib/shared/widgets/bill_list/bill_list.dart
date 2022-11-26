import 'package:flutter/material.dart';
import 'package:nlwt/shared/models/bill_model.dart';
import 'package:nlwt/shared/widgets/bill_list/bill_list_controller.dart';

import '../bill_tile/bill_tile.dart';

class BillList extends StatefulWidget {
  final BillListController controller;
  const BillList({super.key, required this.controller});

  @override
  State<BillList> createState() => _BillListState();
}

class _BillListState extends State<BillList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BillModel>>(
        valueListenable: widget.controller.billsNotifier,
        builder: (_, bills, __) => Column(
              children: bills.map((bill) => BillTile(data: bill)).toList(),
            ));
  }
}
