import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanController extends GetxController{

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? viewController;
  bool scanning = true;

  void toggleFlash(bool isFlashOn) {
    if (viewController != null) {
      viewController?.toggleFlash();
    }
  }
}