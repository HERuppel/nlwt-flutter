import 'package:flutter/material.dart';
import 'package:nlwt/shared/models/bill_model.dart';
import 'package:nlwt/shared/themes/app_text_style.dart';

class BillTile extends StatelessWidget {
  final BillModel data;
  const BillTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        data.name!,
        style: TextStyles.titleListTile,
      ),
      subtitle: Text(
        "Vence em ${data.dueDate}",
        style: TextStyles.captionBody,
      ),
      trailing: Text.rich(TextSpan(
          text: "R\$ ",
          style: TextStyles.trailingRegular,
          children: [
            TextSpan(
                text: data.value!.toStringAsFixed(2),
                style: TextStyles.trailingBold)
          ])),
    );
  }
}
