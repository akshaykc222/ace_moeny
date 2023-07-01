import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpiIdController extends GetxController{
 TextEditingController textEditingController = TextEditingController();
  Color buttonColor = Colors.grey; // Default button color

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
