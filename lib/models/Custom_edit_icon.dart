import 'package:flutter/material.dart';
import 'package:register/controllers/details_controller.dart';
import 'package:register/models/custom_text_form_field.dart';
import 'package:register/utilities/color_utilities.dart';
import 'package:get/get.dart';
import 'package:register/views/details.dart';

class CustomEditIcon extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  CustomEditIcon({
    Key? key,
    this.hintText,
    this.validator,
    this.controller,
  }) : super(key: key);

  final DetailsController d = Get.find(tag: DetailsController().toString());

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.bottomSheet(
          Container(
            height: 150,
            width: 380,
            color: ColorUtilities.whiteColor,
            child: Column(
              children: [
                CustomTextFromField(
                  controller: controller,
                  hintText: hintText,
                  validator: validator,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("update"),
                ),
              ],
            ),
          ),
        );
      },
      icon: Icon(
        Icons.edit,
        color: ColorUtilities.blueColor,
      ),
    );
  }
}
