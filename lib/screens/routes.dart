import 'package:ecommerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce_app/screens/forgot_password/forgot_password_screem.dart';
import 'package:ecommerce_app/screens/log_in_success/login_success_screen.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/screens/splash/spalsh_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routename: (context) => const SplashScreen(),
  SignInScreen.routename: (context) => const SignInScreen(),
  ForgotPasswordScreen.routename: (context) => const ForgotPasswordScreen(),
  LogInSuccessScreen.routename: (context) => const LogInSuccessScreen(),
  SignUpScreen.routename: (context) => const SignUpScreen(),
  CompleteProfileScreen.routename: (context) => const CompleteProfileScreen(),
  OtpScreen.routename: (context) => const OtpScreen(),
};
