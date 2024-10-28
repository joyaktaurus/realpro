import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'forgot_pass_controller.dart';

class ForgotPassBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPassController>(
          () => ForgotPassController(),
    );
  }
}