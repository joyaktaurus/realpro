import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../components/app_buttons.dart';
import '../../utils/my_theme.dart';
import '../../utils/my_utils.dart';
import 'forgot_pass_controller.dart';

class ForgotPassView extends GetView<ForgotPassController> {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/RealProAlliance 1.png")),
              SizedBox(height: 30),
              Text(
                "Forgot Password?",
                style: MyTheme.regularTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Get.height * 0.035,
                    color: MyTheme.myBlueDark),
              ),
              Text(
                "Enter your registered email ID to reset the password",
                style: MyTheme.regularTextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: Get.height * 0.016,
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Form(
                  // key: controller.formKey,
                  child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: Get.height * .03),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            40) // Correct way to add a border
                        ),
                    child: TextFormField(
                      // controller: controller.usernameController,
                      decoration: textBoxDecorationn(
                          'User Name', Icon(Icons.email_outlined)),
                      textInputAction: TextInputAction.next,
                      contextMenuBuilder: (BuildContext context,
                          EditableTextState editableTextState) {
                        return AdaptiveTextSelectionToolbar(
                          anchors: editableTextState.contextMenuAnchors,
                          children: [
                            TextSelectionToolbarTextButton(
                              onPressed: () => editableTextState
                                  .cutSelection(SelectionChangedCause.toolbar),
                              padding: EdgeInsets.all(8),
                              child: const Text('Cut'),
                            ),
                            TextSelectionToolbarTextButton(
                              onPressed: () => editableTextState
                                  .copySelection(SelectionChangedCause.toolbar),
                              child: const Text('Copy'),
                              padding: EdgeInsets.all(8),
                            ),
                            TextSelectionToolbarTextButton(
                              onPressed: () => editableTextState
                                  .pasteText(SelectionChangedCause.toolbar),
                              child: const Text('Paste'),
                              padding: EdgeInsets.all(8),
                            ),
                            TextSelectionToolbarTextButton(
                              onPressed: () => editableTextState
                                  .selectAll(SelectionChangedCause.toolbar),
                              child: const Text('Select All'),
                              padding: EdgeInsets.all(8),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Get.height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed(Routes.forgotPassPage);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: MyTheme.regularTextStyle(
                              fontSize: Get.height * .018,
                              color: MyTheme.myBlueDark),
                        ),
                      ),
                    ],
                  ),
                ]),
              )),
              SizedBox(height: Get.height * 0.02),
              Center(
                child: MAButton(
                  text: 'Login',
                  buttonPress: () async {
                    // controller.doLogin();
                  },
                  // color: Colors.white,
                  // colors:MyTheme.myBlueDark,
                  isEnabled: true,
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 15),
                  height: Get.height * 0.06,
                  width: Get.width * 0.5,
                  clipBehavior: 0,
                  radius: 30,
                  fontSize: 20,
                ),
              ),
              // Obx(
              //   () => controller.isLoggingProgress.value == true
              //       ? Padding(
              //           padding: const EdgeInsets.all(18.0),
              //           child: const RoundedLoader(),
              //         )
              //       : Center(
              //         child: MAButton(
              //             text: 'Login',
              //             buttonPress: () async {
              //               controller.doLogin();
              //             },
              //             // color: Colors.white,
              //             // colors:MyTheme.myBlueDark,
              //             isEnabled: true,
              //             padding:  EdgeInsets.only(left: 30, right: 30,top: 30,bottom: 15),
              //             height: Get.height * 0.06,
              //             width: Get.width * 0.5,
              //             clipBehavior: 0,
              //             radius: 30,
              //             fontSize: 20,
              //           ),
              //       ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have An Account Yet?",
                    style: MyTheme.regularTextStyle(
                        fontSize: Get.height * .015,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "\ Sign Up Here",
                    style: MyTheme.regularTextStyle(
                        fontSize: Get.height * .015,
                        fontWeight: FontWeight.w500,
                        color: MyTheme.myBlueDark),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}

InputDecoration textBoxDecoration(hintText, suffixicon, prfixIcon) {
  return InputDecoration(
    prefixIcon: prfixIcon,
    suffixIcon: suffixicon,
    suffixIconColor: MyTheme.myBlueDark,
    hintText: hintText,
    border: InputBorder.none,
    hintStyle: MyTheme.regularTextStyle(fontSize: 18),
  );
}

InputDecoration textBoxDecorationn(
  hintText,
  prfixIcon,
) {
  return InputDecoration(
    prefixIcon: prfixIcon,
    prefixIconColor: MyTheme.myBlueDark,
    hintText: hintText,
    border: InputBorder.none,
    hintStyle: MyTheme.regularTextStyle(fontSize: 18),
  );
}
