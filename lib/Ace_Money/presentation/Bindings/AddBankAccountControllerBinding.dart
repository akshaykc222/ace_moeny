import 'package:get/get.dart';

import '../Manager/AddBankAccountController.dart';

class AddBankAccountControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBankAccountController());
  }
}
