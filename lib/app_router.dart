import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constant/strings.dart';
import 'package:hungry_app/features/auth/view/login_view.dart';
import 'package:hungry_app/features/auth/view/profile_view.dart';
import 'package:hungry_app/features/auth/view/signup_view.dart';
import 'package:hungry_app/features/cart/view/cart_view.dart';
import 'package:hungry_app/features/check_out/view/check_out_view.dart';
import 'package:hungry_app/features/home/view/home_view.dart';
import 'package:hungry_app/features/orderHistory/view/order_history_view.dart';
import 'package:hungry_app/features/product/view/product_details_view.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/splash.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRouter:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case loginRouter:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case signupRouter:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case homeRouter:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case cartRouter:
        return MaterialPageRoute(builder: (_) => const CartView());
      case orderHistoryRouter:
        return MaterialPageRoute(builder: (_) => const OrderHistoryView());
      case profileRouter:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case checkoutRouter:
        return MaterialPageRoute(builder: (_) => const CheckOutView());
      case productRouter:
        return MaterialPageRoute(builder: (_) => const ProductDetailsView());
      case rootRouter:
        return MaterialPageRoute(builder: (_) => const Root());
    }
  }
}

