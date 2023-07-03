import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/paycontactsController.dart';
import 'package:untitled7/Ace_Money/presentation/Manager/paymentUsingcontactsController.dart';
import 'package:untitled7/Ace_Money/presentation/pages/payContacts.dart';
import 'package:untitled7/Ace_Money/presentation/themes/app_colors.dart';

class PayMentUingContacts extends StatefulWidget {
  const PayMentUingContacts(
      {Key? key, required this.title, required this.subtitile})
      : super(key: key);
  final String title;
  final String subtitile;

  @override
  State<PayMentUingContacts> createState() => _PayMentUingContactsState();
}

class _PayMentUingContactsState extends State<PayMentUingContacts> {
  @override
  Widget build(BuildContext context) {
    final paycontactscontroller = Get.find<PayContactsController>();
    final paymentusingcontactscontroller =
        Get.put(PaymentUsingcontactsController());
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 5,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.white,
            )),
        title: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.subtitile,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: WillPopScope(
        onWillPop: () {
          paycontactscontroller.filteredList.clear();
          paycontactscontroller.filteredList
              .addAll(paycontactscontroller.contactslist);
          paycontactscontroller.searchController.clear();
          return Future.value(true);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              child: Align(
                  alignment: Alignment.center,
                  child: Center(child: Text("payment to ${widget.title}"))),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          color: AppColors.primaryColor,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Wrap(alignment: WrapAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Obx(() => paymentusingcontactscontroller.isshow.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transfer Money to",
                          style: TextStyle(color: AppColors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Banking Name:${widget.title}",
                          style: TextStyle(color: AppColors.white),
                        )
                      ],
                    )
                  : SizedBox()),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      controller:
                          paymentusingcontactscontroller.paymentcontroller,
                      autofocus: true,
                      onChanged: (value) {
                        if (value == null || value.isEmpty) {
                          paymentusingcontactscontroller.isshow.value = false;
                        } else {
                          paymentusingcontactscontroller.isshow.value = true;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Amount",
                          prefixText: "₹",
                          hintStyle: TextStyle(color: AppColors.white),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send_outlined,
                            color: Colors.white,
                          ))),
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
