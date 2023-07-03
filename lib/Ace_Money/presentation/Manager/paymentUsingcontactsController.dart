import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentUsingcontactsController extends GetxController {
  final paymentcontroller = TextEditingController();
  final isshow = false.obs;
  show() {
    isshow.value = true;
  }
}
