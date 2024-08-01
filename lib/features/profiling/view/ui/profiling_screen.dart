import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:venturo_form_stepper/features/profiling/constants/profiling_assets_constant.dart';
import 'package:venturo_form_stepper/features/profiling/controllers/profiling_controller.dart';
import 'package:venturo_form_stepper/features/profiling/sub_features/profiling_one/view/ui/profiling_one_screen.dart';
import 'package:venturo_form_stepper/features/profiling/sub_features/profiling_two/view/ui/profiling_two_screen.dart';
import 'package:venturo_form_stepper/features/profiling/view/components/progress_profiling_component.dart';
import 'package:venturo_form_stepper/shared/widgets/primary_button_widget.dart';

class ProfilingScreen extends StatelessWidget {
  ProfilingScreen({Key? key}) : super(key: key);

  final assetsConstant = ProfilingAssetsConstant();
  @override
  Widget build(BuildContext context) {
    var controller = ProfilingController.to;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                ProgressProfilingComponent(controller: controller),
                SizedBox(height: 16.h),
                Obx(() {
                  var profilingStep = controller.profilingStepIndex.value;

                  if (profilingStep == 0) {
                    return ProfilingOneScreen();
                  }

                  if (profilingStep == 1) {
                    return ProfilingTwoScreen();
                  }

                  if (profilingStep == 2) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Profiling Step 3'),
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryButtonWidget(
                                label: 'Previous',
                                onPressed: () {
                                  ProfilingController.to
                                      .previousProfilingStep();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }

                  return const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
