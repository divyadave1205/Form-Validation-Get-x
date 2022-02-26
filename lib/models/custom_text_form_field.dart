import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register/controllers/details_controller.dart';
import 'package:register/utilities/color_utilities.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final DetailsController d = Get.find(tag: DetailsController().toString());

  CustomTextFromField({
    this.controller,
    this.hintText,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) {
        d.userName = d.userNameTextController.text;
        d.countryCode = d.countryCodeTextController.text.obs;
        d.phoneNumber = d.phoneNumberTextController.text.obs;
        d.password = d.passwordTextController.text.obs;
        print("UserName : ${d.userName}");
        print("countryCode : ${d.countryCode}");
        print("phoneNumber: ${d.phoneNumber}");
        print("password: ${d.password}");
        d.update();
      },
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorUtilities.blueColor,
            width: 2,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorUtilities.blueColor,
        ),
        filled: true,
        fillColor: ColorUtilities.blueColor.withOpacity(0.3),
      ),
      validator: validator,
    );
  }
}
