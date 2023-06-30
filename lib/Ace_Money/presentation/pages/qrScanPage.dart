import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:untitled7/Ace_Money/presentation/manager/Controller/DashBoard_Controller.dart';
import 'package:untitled7/Ace_Money/presentation/manager/Controller/QrScanPageController.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';
import 'package:untitled7/Ace_Money/presentation/widgets/appBar.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final controller = Get.put(QrScanController());
  bool isFlashOn = false;
  final ImagePicker _imagePicker = ImagePicker();
  // final dashController = Get.find<DashBoardController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Stack(
        children: [
          _buildQrView(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Scan QR Code',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  isFlashOn ? Icons.flash_off : Icons.flash_on,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isFlashOn = !isFlashOn;
                  });
                  controller.toggleFlash(isFlashOn);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  backgroundColor: AppColors.white,
                  onPressed: () => scanFromGallery(),
                  child: const Icon(Icons.image,color: AppColors.primaryColor,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: controller.qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.75,
      ),
      cameraFacing: CameraFacing.back,
      formatsAllowed: [BarcodeFormat.qrcode],
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      overlayMargin: const EdgeInsets.all(16),
    );
  }

  void _onQRViewCreated(QRViewController viewController) {
    controller.viewController = viewController;
    viewController.scannedDataStream.listen((scanData) {
      setState(() {
        controller.scanning = false;
      });
      // Handle the scanned data
      print(scanData.code);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Camera permission not granted')),
      );
    }
  }

  Future<void> scanFromGallery() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final qrImageFile = File(pickedFile.path);
      final result = await controller.viewController;
      if (result != null) {
// Handle the scanned data
        print(result);
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
}
