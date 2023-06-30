import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../domain/entities/IconModal.dart';

class DashBoardController extends GetxController{
  final List<CustomIconModal> dashIcons = [
    CustomIconModal(title: 'QR Scan', customIconModal: Icons.qr_code_scanner_rounded),
    CustomIconModal(title: 'Pay Contact', customIconModal: Icons.perm_contact_cal_sharp),
    CustomIconModal(title: 'Bank', customIconModal: FontAwesomeIcons.buildingColumns),
    CustomIconModal(title: 'Pay UPI ID or Number', customIconModal: FontAwesomeIcons.at),
  ];
   List<Color> colors = [
   Colors.blue, Colors.green, Colors.redAccent , Colors.yellowAccent
  ];
}