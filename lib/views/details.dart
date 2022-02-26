import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register/controllers/details_controller.dart';
import 'package:register/models/Custom_edit_icon.dart';
import 'package:register/utilities/color_utilities.dart';

class Details extends StatelessWidget {
  Details({Key? key}) : super(key: key);
  final DetailsController d = Get.find(tag: DetailsController().toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Here are your details...",
              style: TextStyle(
                color: ColorUtilities.blueColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: GetBuilder(
                            init: d,
                            builder: (_) {
                              print("user name");
                              return Text(
                                "Username : ${d.userName}",
                                style: TextStyle(
                                  color: ColorUtilities.blueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            })),
                    CustomEditIcon(
                      controller: d.userNameTextController,
                      hintText: "username",
                      validator: (value) {
                        if (!GetUtils.isUsername(value!)) {
                          return "Username is not valid";
                        }
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: GetBuilder(
                            init: d,
                            builder: (_) {
                              print("Phone number");
                              return Text(
                                "Phone number : ${d.phoneNumber}",
                                style: TextStyle(
                                  color: ColorUtilities.blueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            })),
                    CustomEditIcon(
                      controller: d.phoneNumberTextController,
                      hintText: "Phone number",
                      validator: (value) {
                        if (!GetUtils.isPhoneNumber(value!)) {
                          return "Phone Number is not valid...";
                        }
                        if (!GetUtils.isLengthEqualTo(value, 10)) {
                          return "Enter 10 Digits...";
                        }
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: GetBuilder(
                            init: d,
                            builder: (_) {
                              print("Password");
                              return Text(
                                "Password : ${d.password}",
                                style: TextStyle(
                                  color: ColorUtilities.blueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            })),
                    CustomEditIcon(
                      controller: d.passwordTextController,
                      hintText: "password",
                      validator: (value) {
                        if (value!.contains(
                            "r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$'")) {
                          return "Password is not valid...";
                        }
                        if (!GetUtils.isLengthBetween(value, 8, 15)) {
                          return "Enter 8 to 15 Digits...";
                        }
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
