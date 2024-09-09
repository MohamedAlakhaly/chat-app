import 'package:chat_app/constant/app_routes.dart';
import 'package:chat_app/modules/auth/forget_password/view/forget_password_view.dart';
import 'package:chat_app/modules/auth/sign_in/view/sign_in_view.dart';
import 'package:chat_app/modules/auth/sign_up/view/sign_up_view.dart';
import 'package:chat_app/modules/auth/success_send_email/view/success_send_email_view.dart';
import 'package:chat_app/modules/auth/verified_email/view/verified_email_view.dart';
import 'package:chat_app/modules/home/view/home_view.dart';
import 'package:chat_app/modules/search/view/search_view.dart';
import 'package:chat_app/modules/splash/view/splash_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRoutes.splashView, page: () => const SplashView()),
  GetPage(name: AppRoutes.signIn, page: () => const SignInView()),
  GetPage(name: AppRoutes.signUn, page: () => const SignUpView()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPasswordView()),
  GetPage(name: AppRoutes.successSendEmail, page: () => const SuccessSendEmailView()),
  GetPage(name: AppRoutes.verifiedEmail, page: () => const VerifiedEmailView()),
  GetPage(name: AppRoutes.homeView, page: () => const HomeView()),
  GetPage(name: AppRoutes.searchView, page: () => const SearchView()),
];
