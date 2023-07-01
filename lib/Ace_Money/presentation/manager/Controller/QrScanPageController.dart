import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../routes/App_Pages.dart';

class QrScanController extends GetxController{

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? viewController;
  bool scanning = true;

  final ImagePicker _imagePicker = ImagePicker();

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


  Future<void> scanFromGallery(BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      //final qrImageFile = File(pickedFile.path);
      final result = await viewController;
      if (result != null) {
// Handle the scanned data
        print(result);
        Get.toNamed(AppPages.payupiidpage2);
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to scan QR code from image'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Camera permission not granted')),
      );
    }
  }

  void _onQRViewCreated(QRViewController viewController) {
    viewController = viewController;
    viewController.scannedDataStream.listen((scanData) {
        scanning = false;
      // Handle the scanned data
      print(scanData.code);
    });
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 20,
        borderLength: 30,
        borderWidth: 20,
        cutOutSize: MediaQuery.of(context).size.width * 0.75,
      ),
      cameraFacing: CameraFacing.back,
      formatsAllowed: [BarcodeFormat.qrcode],
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      overlayMargin: const EdgeInsets.all(16),
    );
  }

}