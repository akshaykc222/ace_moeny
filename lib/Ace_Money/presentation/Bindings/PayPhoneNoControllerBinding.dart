import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/payPhoneNoController.dart';

class PayPhoneNoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayPhoneNoController());
  }
}
