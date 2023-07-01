import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/manager/Controller/QrScanPageController.dart';

class QrScanControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrScanController());
    // TODO: implement dependencies
  }
}
