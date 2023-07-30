


import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'icon_button.dart';

class BarcodeIconBtn extends StatelessWidget {
  const BarcodeIconBtn({super.key, required this.onScanned});
  final Function(String code) onScanned;

  @override
  Widget build(BuildContext context) {
    return KIconButton(
      child: const Icon(Icons.qr_code_scanner_outlined),
      onPressed: () async {
        var res = await Nav.to<String>(const SimpleBarcodeScannerPage());
        if (res is String && res != "-1") {
          onScanned.call(res);
        }
      },
    );
  }
}
