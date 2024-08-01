import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilingProfilingOneController extends GetxController {
  static ProfilingProfilingOneController get to => Get.find();

  var nameController = TextEditingController();
  var nameErrorMessage = "".obs;

  var emailController = TextEditingController();
  var emailErrorMessage = "".obs;

  var phoneController = TextEditingController();
  var phoneErrorMessage = "".obs;

  var passwordController = TextEditingController();
  var passwordErrorMessage = "".obs;
  var obscurePassword = true.obs;

  var passwordConfirmationController = TextEditingController();
  var passwordConfirmationErrorMessage = "".obs;
  var obscurePasswordConfirmation = true.obs;

  @override
  void onInit() {
    super.onInit();

    nameController.addListener(nameListener);
    emailController.addListener(emailListener);
    phoneController.addListener(phoneListener);
    passwordController.addListener(passwordListener);
    passwordConfirmationController.addListener(passwordConfirmationListener);
  }

  void nameListener() {
    var name = nameController.text.trim();
    if (name.isEmpty) {
      nameErrorMessage.value = "Nama tidak boleh kosong";
      return;
    }

    nameErrorMessage.value = "";
  }

  void emailListener() {
    var email = emailController.text.trim();
    if (email.isEmpty) {
      emailErrorMessage.value = "Email tidak boleh kosong";
      return;
    }

    if (!isValidEmail(email)) {
      emailErrorMessage.value = "Email tidak sesuai format";
      return;
    }

    emailErrorMessage.value = "";
  }

  void phoneListener() {
    var phone = phoneController.text.trim();
    if (phone.isEmpty) {
      phoneErrorMessage.value = "No Hp tidak boleh kosong";
      return;
    }

    if (phone.isNotEmpty && phone.length < 9) {
      phoneErrorMessage.value = "No Hp minimal terdiri dari 9 karakter";
      return;
    }

    if (phone.startsWith("0")) {
      phoneErrorMessage.value = "Tidak boleh diawali dengan 0";
      return;
    }

    phoneErrorMessage.value = "";
  }

  void passwordListener() {
    var password = passwordController.text.trim();
    if (password.isEmpty) {
      passwordErrorMessage.value = "Kata sandi tidak boleh kosong";
      return;
    }

    if (password.isNotEmpty && password.length < 9) {
      passwordErrorMessage.value = "Kata sandi minimal terdiri dari 9 karakter";
      return;
    }

    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp lowerCase = RegExp(r'[a-z]');
    RegExp number = RegExp(r'[0-9]');

    if (!upperCase.hasMatch(password)) {
      passwordErrorMessage.value = "Kata sandi harus mengandung 1 huruf besar";
      return;
    }

    if (!lowerCase.hasMatch(password)) {
      passwordErrorMessage.value = "Kata sandi harus mengandung 1 huruf kecil";
      return;
    }

    if (!number.hasMatch(password)) {
      passwordErrorMessage.value = "Kata sandi harus mengandung 1 angka";
      return;
    }

    passwordErrorMessage.value = "";
  }

  void passwordConfirmationListener() {
    var passwordConfirmation = passwordConfirmationController.text.trim();
    if (passwordConfirmation.isEmpty) {
      passwordConfirmationErrorMessage.value =
          "Konfirmasi Kata sandi tidak boleh kosong";
      return;
    }

    var password = passwordController.text.trim();
    if (passwordConfirmation != password) {
      passwordConfirmationErrorMessage.value =
          "Konfirmasi Kata sandi tidak sama";
      return;
    }

    passwordConfirmationErrorMessage.value = "";
  }

  void showPassword() {
    obscurePassword.toggle();
  }

  void showConfirmationPassword() {
    obscurePasswordConfirmation.toggle();
  }

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool canNext(){
    return nameErrorMessage.value.isEmpty &&
        emailErrorMessage.value.isEmpty &&
        phoneErrorMessage.value.isEmpty &&
        passwordErrorMessage.value.isEmpty &&
        passwordConfirmationErrorMessage.value.isEmpty;
  }
}
