import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/paymentUsingcontactsController.dart';

class paymentUsingcontactsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentUsingcontactsController());
  }
}
