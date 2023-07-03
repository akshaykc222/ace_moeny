import 'dart:async';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';

class PayContactsController extends GetxController {
  final searchController = TextEditingController();
  RxList<Contact> contactslist = <Contact>[].obs;
  final filteredList = <Contact>[].obs;

  final isloading = false.obs;
  List colors = [
    AppColors.red,
    AppColors.yellow,
    AppColors.blue,
    AppColors.green,
    AppColors.midOrange,
    AppColors.peach,
    AppColors.skyBlue,
    AppColors.brown,
    AppColors.primaryColor
  ];
//to access contacts
  Future displayContacts() async {
    PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus.isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      isloading.value = true;
      contactslist.value = contacts.toList();
      filteredList.clear();
      filteredList.addAll(contactslist);
    } else {
      print("permission denied");
    }
  }

  void filtereditems(String query) {
    filteredList.clear();
    filteredList.addAll(contactslist);
    debugPrint("filteredfirst=${filteredList.length}");
    List<Contact> temp = filteredList
        .where((p0) =>
            (p0.displayName?.toLowerCase().contains(query) == true) ||
            (p0.phones
                    ?.where((element) =>
                        element.value?.replaceAll(" ", "").contains(query) ==
                        true)
                    .isNotEmpty ==
                true))
        .toList();
    debugPrint("temp=${temp.length}");
    filteredList.clear();
    filteredList.addAll(temp);
    debugPrint("filtered=${filteredList.length}");
  }

  bool isDigit(String value) {
    return int.tryParse(value) != null;
  }

  bool isText(String value) {
    return int.tryParse(value) == null;
  }

  @override
  void onInit() {
    filteredList.addAll(contactslist);
    displayContacts();
    isDigit(searchController.text);
    isText(searchController.text);
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
