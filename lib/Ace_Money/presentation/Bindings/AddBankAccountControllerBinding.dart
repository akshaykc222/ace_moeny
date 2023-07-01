import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/manager/Controller/AddBankAccountController.dart';

class AddBankAccountControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddBankAccountController());
  }
}