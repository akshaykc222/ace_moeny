import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled7/Ace_Money/presentation/manager/upiid_controller.dart';

import '../themes/app_colors.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.required,
      this.onPressed,
      this.passwordfield,
      this.showSuffixicon,
      this.controller,
      this.suffix,
      this.validator,
      this.inputType,
      this.lines,
      this.onChanged,
      this.onTap,
      this.readOnly,
      this.prefix,
      this.focusNode,
      this.enableInteractiveSelection,
      required this.label,
      this.enable});
  final TextEditingController? controller;
  final String? hintText;
  final bool? required;
  final bool? showSuffixicon;
  final bool? enable;
  final Function? onPressed;
  final Function? onTap;
  final bool? passwordfield;
  final Widget? suffix;
  final Function(String)? validator;
  final TextInputType? inputType;
  final int? lines;
  final Widget? prefix;
  final bool? readOnly;
  final Widget? label;
  final Function? onChanged;
  final bool? enableInteractiveSelection;
  final FocusNode? focusNode;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final controller= Get.find<UpiIdController>();
  bool showpassword = true;
  late bool showPrefixIcon;

  @override
  void initState() {
    showPrefixIcon = widget.showSuffixicon ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 4.0, top: 5),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child:
          //     MandatoryText(
          //       title: widget.hintText!,
          //       requiredTxt: widget.required,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          TextFormField(
            onChanged: (text){
            setState(() {
              controller.buttonColor= text.isEmpty?Colors.grey:AppColors.primaryColor;
            });
            },
            focusNode: widget.focusNode,
            enableInteractiveSelection:
                widget.enableInteractiveSelection ?? true,
            controller: widget.controller,
            validator: widget.validator == null
                ? null
                : (val) => widget.validator!(val ?? ""),
            obscureText: widget.passwordfield == true ? showpassword : false,
            keyboardType: widget.inputType ?? TextInputType.text,
            maxLines: widget.passwordfield == true ? 1 : widget.lines,
            decoration: InputDecoration(
                filled: true,
                label: widget.label,
                fillColor: AppColors.white,
                prefixIcon: showPrefixIcon ? widget.prefix : null,
                suffixIcon: widget.passwordfield == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showpassword = !showpassword;
                          });
                        },
                        icon: showpassword
                            ? const Icon(
                                FontAwesomeIcons.eyeSlash,
                                size: 20,
                              )
                            : const Icon(Icons.remove_red_eye))
                    : widget.suffix,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.black)),
                hintText: widget.hintText,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                hintStyle: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
