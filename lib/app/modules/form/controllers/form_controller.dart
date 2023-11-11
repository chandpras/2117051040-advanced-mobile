import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  //TODO: Implement FormController
  TextEditingController emailController = TextEditingController();
  final isEmailValid = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
