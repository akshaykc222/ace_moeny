import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/manager/upiid_controller.dart';

class UpiIdControllerBindings extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => UpiIdController());
  }

}