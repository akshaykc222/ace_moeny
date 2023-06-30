import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/manager/QrScanPageController.dart';

class AccountControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrScanController());
    // TODO: implement dependencies
  }
}
