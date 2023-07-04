import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/paycontactsController.dart';
import 'package:untitled7/Ace_Money/presentation/pages/MobNoVerification.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payupiid_page2.dart';

import '../themes/app_colors.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:contacts_service/contacts_service.dart';

class PayContacts extends StatefulWidget {
  PayContacts({super.key});

  @override
  State<PayContacts> createState() => _PayContactsState();
}

class _PayContactsState extends State<PayContacts> {
  final controller = Get.find<PayContactsController>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                        controller.searchController.clear();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.black,
                      )),
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: AppColors.black,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            decoration: InputDecoration(
                              hintText: "Search",
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.grey,
                              ),
                            ),
                            controller: controller.searchController,
                            onChanged: (value) {
                              setState(() {});
                              controller.filtereditems(value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    Icons.more_vert,
                    color: AppColors.black,
                  ))
                ],
              ),
            ),

            ///Contact Lists
            WillPopScope(
              onWillPop: () {
                controller.filteredList.clear();
                controller.filteredList.addAll(controller.contactslist);
                return Future.value(true);
              },
              child: Obx(() => controller.isloading == false
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Wrap(children: [
                        controller.filteredList.isEmpty &&
                                controller
                                    .isDigit(controller.searchController.text)
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  color: AppColors.lightGrey,
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      title: Text(
                                        controller.searchController.text,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          "This person not in your contact",
                                          style: TextStyle(
                                              color: AppColors.blue,
                                              fontSize: 10),
                                        ),
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            Get.to(PayUpiIdScreen2(
                                                paymentTo: controller
                                                    .searchController.text));
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColors.black,
                                          )),
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, bottom: 10, top: 10),
                                child: Text(
                                  "All Contacts",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.filteredList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(PayUpiIdScreen2(
                                  paymentTo: controller
                                          .filteredList[index].displayName ??
                                      "",
                                ));
                              },
                              child: ListTile(
                                title: Text(controller
                                        .filteredList[index].displayName ??
                                    ""),
                                subtitle: Text(controller.filteredList[index]
                                            .phones?.isNotEmpty ==
                                        true
                                    ? controller.filteredList[index].phones
                                            ?.first.value
                                            .toString() ??
                                        ''
                                    : ""),
                                leading: CircleAvatar(
                                  backgroundColor: controller
                                      .colors[index % controller.colors.length],
                                  radius: 20,
                                  child: Center(
                                    child: Text(
                                      controller.filteredList[index].displayName
                                              ?.substring(0, 1) ??
                                          "",
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ]),
                    )),
            )
          ],
        ),
      ),
    ));
  }
}
