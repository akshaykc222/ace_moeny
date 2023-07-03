import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/DashBoard_Controller.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
  }
}
