// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:realpro/utils/my_extensions.dart';
// import '../../app.dart';
// import '../../models/api_resp.dart';
// import '../../models/login_model.dart';
// import '../../services/login_services.dart';
// import '../../utils/err_m.dart';
// import '../../utils/local_store.dart';
// import '../../utils/routes.dart';
//
// class LoginViewController extends GetxController {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   RxBool showPassword = false.obs;
//
//   void togglePasswordVisibility() {
//     showPassword.toggle();
//   }
//
//   final FocusNode userCtrlfocusNode = FocusNode();
//   final FocusNode pswdCtrlfocusNode = FocusNode();
//   RxBool isLoggingProgress = false.obs;
//
//   Future<void> doLogin() async {
//     LocalStore.clearData();
//     isLoggingProgress.value = true;
//     final String username = usernameController.text;
//     final String password = passwordController.text;
//
//     if (!username.isValidEmail()) {
//       userCtrlfocusNode.requestFocus();
//       showMsg('Please provide a valid User Name', 'Invalid');
//       isLoggingProgress.value = false;
//     } else if (!password.isValidPassword()['isValid']) {
//       pswdCtrlfocusNode.requestFocus();
//       showMsg('Please provide a valid Password', 'Invalid');
//       isLoggingProgress.value = false;
//     } else {
//       final ApiResp resp = await LoginServices.fetchUser(username, password);
//       if (resp.ok == false) {
//         // Assuming that the API response can differentiate between incorrect email and incorrect password
//         if (username.isValidEmail() && !password
//             .isValidPassword()['isValid']) {
//           Get.snackbar(
//             "Incorrect credentials",
//             "Please check your username and password",
//             backgroundColor: Colors.red,
//           );
//         } else {
//           Get.snackbar(
//             "Incorrect credentials",
//             "Please check your username and password",
//             backgroundColor: Colors.red,
//           );
//         }
//         isLoggingProgress.value = false;
//         return;
//       }
//
//       User user = User.fromJson(resp.rdata);
//       LocalStore.setData('user_id', user.customerDetails!.id);
//       LocalStore.setData('token', user.customerDetails!.apiToken);
//       LocalStore.setData('name', user.customerDetails!.username);
//       LocalStore.setData('phone', user.customerDetails!.phone);
//       LocalStore.setData('email', user.customerDetails!.email);
//       isLoggingProgress.value = false;
//       App.user = user.customerDetails!;
//       App.token = user.customerDetails!.apiToken!;
//
//       if (user.customerDetails?.apiToken?.isEmpty == true ||
//           user.customerDetails?.username?.isEmpty == true) {
//         Get.snackbar("Failed", "Login failed", backgroundColor: Colors.red);
//         isLoggingProgress.value = false;
//         return;
//       } else {
//         App.token = user.customerDetails!.apiToken!;
//         //Get.offAllNamed(Routes.acListing);
//       }
//     }
//   }
// }
//
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realpro/utils/my_extensions.dart';
import '../../app.dart';
import '../../models/api_resp.dart';
import '../../models/login_model.dart';
import '../../services/login_services.dart';
import '../../utils/err_m.dart';
import '../../utils/local_store.dart';
import '../../utils/routes.dart';

class LoginViewController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPassword = false.obs;
  final FocusNode userCtrlfocusNode = FocusNode();
  final FocusNode pswdCtrlfocusNode = FocusNode();
  RxBool isLoggingProgress = false.obs;

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  Future<void> doLogin() async {
    LocalStore.clearData();
    isLoggingProgress.value = true;

    final String username = usernameController.text;
    final String password = passwordController.text;

    // Validate email and password
    if (!username.isValidEmail()) {
      userCtrlfocusNode.requestFocus();
      showMsg('Please provide a valid User Name', 'Invalid');
      isLoggingProgress.value = false;
      return;
    } else if (!password.isValidPassword()['isValid']) {
      pswdCtrlfocusNode.requestFocus();
      showMsg('Please provide a valid Password', 'Invalid');
      isLoggingProgress.value = false;
      return;
    }

    // Attempt to log in
    try {
      final ApiResp resp = await LoginServices.fetchUser(username, password);

      if (!resp.ok) {
        Get.snackbar(
          "Login Failed",
          "Please check your username and password",
          backgroundColor: Colors.red,
        );
        isLoggingProgress.value = false;
        return;
      }

      // Successfully logged in
      User user = User.fromJson(resp.rdata);
      LocalStore.setData('user_id', user.customerDetails!.id);
      LocalStore.setData('token', user.customerDetails!.apiToken);
      LocalStore.setData('name', user.customerDetails!.username);
      LocalStore.setData('phone', user.customerDetails!.phone);
      LocalStore.setData('email', user.customerDetails!.email);

      App.user = user.customerDetails!;
      App.token = user.customerDetails!.apiToken!;

      // Check for token and username validity
      if (user.customerDetails?.apiToken?.isEmpty == true ||
          user.customerDetails?.username?.isEmpty == true) {
        Get.snackbar("Failed", "Login failed", backgroundColor: Colors.red);
      } else {
        Get.offAllNamed(Routes.login); // Navigate to the next screen
      }
    } catch (e) {
      print("An error occurred during login: $e");
      Get.snackbar("Error", "An unexpected error occurred", backgroundColor: Colors.red);
    } finally {
      isLoggingProgress.value = false;
    }
  }
}
