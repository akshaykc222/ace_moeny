import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/routes/App_Pages.dart';
import '../../../domain/entities/IconModal.dart';

class DashBoardController extends GetxController {
  final List<CustomIconModal> dashIcons = [
    CustomIconModal(
        title: 'QR Scan', customIconModal: Icons.qr_code_scanner_rounded,
    ontap: (){
          Get.toNamed(AppPages.qrScanPage);
    }
    ),
    CustomIconModal(
        title: 'Pay Using Contact', customIconModal: Icons.perm_contact_cal_sharp, ontap: (){}),
    CustomIconModal(
        title: 'Pay to VPA', customIconModal: FontAwesomeIcons.at, ontap: (){}),
    CustomIconModal(
        title: 'Bank', customIconModal: FontAwesomeIcons.buildingColumns, ontap: (){}),

  ];
  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.redAccent,
    Colors.yellowAccent
  ];
}
