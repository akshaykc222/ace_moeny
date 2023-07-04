import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/MobNoverificationController.dart';

class MobNoverificationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobNoverificationController());
  }
}
