import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nlwt/modules/insert_bill/insert_bill_controller.dart';
import 'package:nlwt/shared/themes/app_colors.dart';
import 'package:nlwt/shared/themes/app_text_style.dart';
import 'package:nlwt/shared/widgets/input_text/input_text.dart';
import 'package:nlwt/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBillPage extends StatefulWidget {
  final String? barcode;
  const InsertBillPage({super.key, this.barcode});

  @override
  State<InsertBillPage> createState() => _InsertBillPageState();
}

class _InsertBillPageState extends State<InsertBillPage> {
  final controller = InsertBillController();
  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 93),
                child: Text(
                  "Preencha os dados do boleto",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputText(
                        label: "Nome do boleto",
                        icon: Icons.description_outlined,
                        onChanged: ((value) {
                          controller.onChange(name: value);
                        }),
                        validator: controller.validateName,
                      ),
                      InputText(
                          controller: dueDateInputTextController,
                          label: "Vencimento",
                          icon: FontAwesomeIcons.timesCircle,
                          validator: controller.validateDueDate,
                          onChanged: ((value) {
                            controller.onChange(dueDate: value);
                          })),
                      InputText(
                          controller: moneyInputTextController,
                          label: "Valor",
                          icon: FontAwesomeIcons.wallet,
                          validator: (_) => controller.validateMoney(
                              moneyInputTextController.numberValue),
                          onChanged: ((value) {
                            controller.onChange(
                                value: moneyInputTextController.numberValue);
                          })),
                      InputText(
                          controller: barcodeInputTextController,
                          label: "Código",
                          icon: FontAwesomeIcons.barcode,
                          validator: controller.validateBarcode,
                          onChanged: ((value) {
                            controller.onChange(barcode: value);
                          })),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          SetLabelButtons(
            primaryLabel: "Cancelar",
            primaryOnPressed: () {
              Navigator.pop(context);
            },
            secondaryLabel: "Cadastrar",
            secondaryOnPressed: () async {
              await controller.createBill();
              Navigator.pop(context);
            },
            enableSecondaryColor: true,
          ),
        ],
      ),
    );
  }
}
