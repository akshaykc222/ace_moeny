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

  void onQRViewCreated(QRViewController controller) {

    controller = controller;

    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();

      // Handle the scanned QR code data
      print('Scanned data: ${scanData.code}');

      // Resume the camera after handling the scan
      controller.resumeCamera();
    });
  }
}