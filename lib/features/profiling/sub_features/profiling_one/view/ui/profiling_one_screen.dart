import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_form_stepper/features/profiling/constants/profiling_assets_constant.dart';
import 'package:venturo_form_stepper/features/profiling/controllers/profiling_controller.dart';
import 'package:venturo_form_stepper/features/profiling/sub_features/profiling_one/controllers/profiling_profiling_one_controller.dart';
import 'package:venturo_form_stepper/shared/widgets/custom_text_field_widget.dart';
import 'package:venturo_form_stepper/shared/widgets/primary_button_widget.dart';

class ProfilingOneScreen extends StatelessWidget {
  ProfilingOneScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfilingAssetsConstant();
  @override
  Widget build(BuildContext context) {
    var controller = ProfilingProfilingOneController.to;

    return Column(
      children: [
        Obx(() {
          String? errorMessage;

          errorMessage = controller.nameErrorMessage.value.trim();
          if (errorMessage.isEmpty) {
            errorMessage = null;
          }

          return CustomTextFieldWidget(
            controller: controller.nameController,
            errorMessage: errorMessage,
            label: 'Nama',
            hint: 'Masukkan nama anda',
          );
        }),
        SizedBox(height: 16.h),
        Obx(() {
          String? errorMessage;

          errorMessage = controller.emailErrorMessage.value.trim();
          if (errorMessage.isEmpty) {
            errorMessage = null;
          }

          return CustomTextFieldWidget(
            controller: controller.emailController,
            errorMessage: errorMessage,
            label: 'Email',
            hint: 'Masukkan email anda',
            inputType: TextInputType.emailAddress,
          );
        }),
        SizedBox(height: 16.h),
        Obx(() {
          String? errorMessage;

          errorMessage = controller.phoneErrorMessage.value.trim();
          if (errorMessage.isEmpty) {
            errorMessage = null;
          }

          return CustomTextFieldWidget(
            controller: controller.phoneController,
            errorMessage: errorMessage,
            label: 'No HP',
            hint: 'Masukkan No HP anda',
            inputType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          );
        }),
        SizedBox(height: 16.h),
        Obx(() {
          String? errorMessage;

          errorMessage = controller.passwordErrorMessage.value.trim();
          if (errorMessage.isEmpty) {
            errorMessage = null;
          }

          var obscurePassword = controller.obscurePassword.value;

          return CustomTextFieldWidget(
            controller: controller.passwordController,
            errorMessage: errorMessage,
            label: 'Kata Sandi',
            hint: 'Masukkan kata sandi anda',
            inputType: TextInputType.visiblePassword,
            obscureText: obscurePassword,
            suffixIcon: InkWell(
              onTap: () => controller.showPassword(),
              child: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility),
            ),
          );
        }),
        SizedBox(height: 16.h),
        Obx(() {
          String? errorMessage;

          errorMessage =
              controller.passwordConfirmationErrorMessage.value.trim();
          if (errorMessage.isEmpty) {
            errorMessage = null;
          }

          var obscurePassword = controller.obscurePasswordConfirmation.value;

          return CustomTextFieldWidget(
            controller: controller.passwordConfirmationController,
            errorMessage: errorMessage,
            label: 'Konfirmasi Kata Sandi',
            hint: 'Masukkan konfirmasi kata sandi',
            inputType: TextInputType.visiblePassword,
            obscureText: obscurePassword,
            suffixIcon: InkWell(
              onTap: () => controller.showConfirmationPassword(),
              child: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility),
            ),
          );
        }),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: PrimaryButtonWidget(
                label: 'Submit',
                onPressed: () {
                  controller.canNext()
                      ? ProfilingController.to.nextProfilingStep()
                      : Get.snackbar(
                          'Error', 'Please fill all the form correctly',
                          snackStyle: SnackStyle.FLOATING);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
