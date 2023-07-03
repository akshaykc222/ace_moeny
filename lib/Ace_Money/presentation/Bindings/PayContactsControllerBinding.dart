import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/paycontactsController.dart';

class PayContactsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayContactsController());
  }
}
