import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:untitled7/Ace_Money/presentation/manager/QrScanPageController.dart';
import 'package:untitled7/Ace_Money/presentation/widgets/appBar.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final controller = Get.put(QrScanController());
  bool isFlashOn = false;

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
      formatsAllowed: const [BarcodeFormat.qrcode],
      overlayMargin: const EdgeInsets.all(16),
      onPermissionSet: (ctrl, p) {
        if (!p) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Camera permission not granted')),
          );
        }
      },
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
}
