import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController countryCodeTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  String userName = "";

  RxString countryCode = "".obs;

  RxString phoneNumber = "".obs;

  RxString password = "".obs;
}
