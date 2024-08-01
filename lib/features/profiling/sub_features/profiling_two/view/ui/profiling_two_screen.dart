import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_form_stepper/features/profiling/constants/profiling_assets_constant.dart';
import 'package:venturo_form_stepper/features/profiling/controllers/profiling_controller.dart';
import 'package:venturo_form_stepper/features/profiling/sub_features/profiling_two/controllers/profiling_profiling_two_controller.dart';
import 'package:venturo_form_stepper/shared/widgets/custom_text_field_widget.dart';
import 'package:venturo_form_stepper/shared/widgets/primary_button_widget.dart';

class ProfilingTwoScreen extends StatelessWidget {
  ProfilingTwoScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfilingAssetsConstant();
  @override
  Widget build(BuildContext context) {
    var controller = ProfilingProfilingTwoController.to;

    return Column(
      children: [
        Obx(() {
          String? errorMessage;

          errorMessage = controller.instagramErrorMessage.value.trim();
          if (errorMessage.isEmpty) {
            errorMessage = null;
          }

          return CustomTextFieldWidget(
            controller: controller.instagramController,
            label: 'Akun Instagram',
            hint: 'Masukkan akun Instagram anda',
            errorMessage: errorMessage,
          );
        }),
        SizedBox(height: 16.h),
        CustomTextFieldWidget(
          controller: TextEditingController(),
          label: 'Akun Tiktok',
          hint: 'Masukkan akun Tiktok anda',
        ),
        SizedBox(height: 16.h),
        CustomTextFieldWidget(
          controller: TextEditingController(),
          label: 'Akun Twitter',
          hint: 'Masukkan akun Twitter anda',
        ),
        SizedBox(height: 16.h),
        CustomTextFieldWidget(
          controller: TextEditingController(),
          label: 'Akun Facebook',
          hint: 'Masukkan akun Facebook anda',
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: PrimaryButtonWidget(
                label: 'Previous',
                onPressed: () {
                  ProfilingController.to.previousProfilingStep();
                },
              ),
            ),
            Expanded(
              child: PrimaryButtonWidget(
                label: 'Submit',
                onPressed: () {
                  ProfilingController.to.nextProfilingStep();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
