import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register/controllers/details_controller.dart';
import 'package:register/models/custom_text_form_field.dart';
import 'package:register/utilities/color_utilities.dart';
import 'package:register/views/details.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final DetailsController d =
        Get.put(DetailsController(), tag: DetailsController().toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtilities.blueColor,
        title: Text(
          'Register Screen',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 380,
                  child: CustomTextFromField(
                    validator: (value) {
                      if (!GetUtils.isUsername(value!)) {
                        return "Username is not valid";
                      }
                    },
                    controller: d.userNameTextController,
                    hintText: "UserName",
                  ),
                ),
              ),
              SizedBox(
                width: 380,
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 60,
                      child: CustomTextFromField(
                        controller: d.countryCodeTextController,
                        hintText: "+91",
                        validator: (value) {
                          if (!GetUtils.isLengthEqualTo(value!, 3)) {
                            return "Error";
                          }
                          if (!value.contains("+91")) {
                            return "wrong";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        width: 320,
                        child: CustomTextFromField(
                          controller: d.phoneNumberTextController,
                          hintText: "Phone Number",
                          validator: (value) {
                            if (!GetUtils.isPhoneNumber(value!)) {
                              return "Phone Number is not valid...";
                            }
                            if (!GetUtils.isLengthEqualTo(value, 10)) {
                              return "Enter 10 Digits...";
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 380,
                child: CustomTextFromField(
                  controller: d.passwordTextController,
                  hintText: "Password",
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
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    d.userName = d.userNameTextController.text;
                    d.countryCode = d.countryCodeTextController.text.obs;
                    d.phoneNumber = d.phoneNumberTextController.text.obs;
                    d.password = d.passwordTextController.text.obs;
                    print("UserName : ${d.userName}");
                    print("countryCode : ${d.countryCode}");
                    print("phoneNumber: ${d.phoneNumber}");
                    print("password: ${d.password}");
                    Get.to(Details());
                  } else {
                    Get.snackbar("Error", "Enter Valid Details");
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
