import 'package:flutter/material.dart';
import 'package:nlwt/shared/themes/app_colors.dart';
import 'package:nlwt/shared/themes/app_text_style.dart';
import 'package:nlwt/shared/widgets/label_button/label_button.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(color: AppColors.background),
          backgroundColor: Colors.black,
          title: Text("Escaneie o código de barras do boleto",
              style: TextStyles.buttonBackground)),
      body: Column(children: [
        Expanded(child: Container(color: Colors.black)),
        Expanded(flex: 2, child: Container(color: Colors.transparent)),
        Expanded(child: Container(color: Colors.black)),
      ]),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: "Inserir código do boleto",
              onPressed: () {},
            ),
          ),
          Expanded(
            child: LabelButton(
              label: "Adicionar da galeria",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
