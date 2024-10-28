import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/forgot_password/forgot_pass_bindings.dart';
import '../screens/forgot_password/forgot_pass_view.dart';
import '../screens/login/login_bindings.dart';
import '../screens/login/login_view.dart';
import '../screens/splashscreen.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const forgotpass = '/forgotpass';
  static const dashBoard = '/dashboard';
  static const customerList = '/customerList';
  static const leadSubmit = '/leadSubmit';
  static const customerDetail = '/customerDetail';
  static const leadListing = '/leadListing';
  static const productListing = '/productListing';
  static const taskListing = '/taskListing';
  static const expenses = '/expenses';
  static const addOrder = '/addOrder';
  static const newLead = '/newLead';
  static const productView = '/productView';


  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      binding: LoginViewBindings(),
      name: login,
      page: () =>  LoginView(),
    ),
    GetPage(
      binding: ForgotPassBindings(),
      name: forgotpass,
      page: () =>  ForgotPassView(),
    ),
  ];

}