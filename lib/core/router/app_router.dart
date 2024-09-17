import 'package:flutter/material.dart';
import 'package:temry_market/presentation/views/authentication/forget_password/forget_Password.dart';
import 'package:temry_market/presentation/views/main/category/category_view.dart';
import 'package:temry_market/presentation/views/main/home/filter/filter_view.dart';

import 'package:temry_market/domain/entities/cart/cart_item.dart';
import 'package:temry_market/domain/entities/product/product.dart';
import 'package:temry_market/presentation/views/authentication/signin_view.dart';
import 'package:temry_market/presentation/views/authentication/signup_view.dart';
import 'package:temry_market/presentation/views/main/main_view.dart';
import 'package:temry_market/presentation/views/main/other/about/about_view.dart';
import 'package:temry_market/presentation/views/main/other/delivery_info/delivery_info.dart';
import 'package:temry_market/presentation/views/main/other/notification/notification_view.dart';
import 'package:temry_market/presentation/views/main/other/orders/order_view.dart';
import 'package:temry_market/presentation/views/main/other/profile/profile_screen.dart';
import 'package:temry_market/presentation/views/main/other/settings/settings_view.dart';
import 'package:temry_market/presentation/views/order_chekout/order_checkout_view.dart';
import 'package:temry_market/presentation/views/product/product_details_view.dart';
import 'package:temry_market/core/error/exceptions.dart';
import 'package:temry_market/presentation/views/product/product_list_view.dart';
import 'package:temry_market/splash_screen.dart';

class AppRouter {
  //main menu
  static const String home = '/';
  static const String splash = '/splash';
  static const String mainview = '/mainview';
  //authentication
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpScreen = '/otpScreen';

  //products
  static const String productDetails = '/product-details';
  static const String productsScreen = '/productsScreen';
  static const String categoryView = '/CategoryView';
  //other
  static const String userProfile = '/user-profile';
  static const String orderCheckout = '/order-checkout';
  static const String deliveryDetails = '/delivery-details';
  static const String orders = '/orders';
  static const String settings = '/settings';
  static const String notifications = '/notifications';
  static const String about = '/about';
  static const String filter = '/filter';
  static const String productDetailsView = '/productDetailsView';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case mainview:
        return MaterialPageRoute(builder: (_) => const MainView());
      case signIn:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case productsScreen:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());

      case productDetails:
        return MaterialPageRoute(builder: (_) => const ProductDetailsView());
      case userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());

      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case orderCheckout:
        List<CartItem> items = routeSettings.arguments as List<CartItem>;
        return MaterialPageRoute(
            builder: (_) => OrderCheckoutView(
                  items: items,
                ));
      case deliveryDetails:
        return MaterialPageRoute(builder: (_) => const DeliveryInfoView());
      case productDetailsView:
        return MaterialPageRoute(builder: (_) => const ProductDetailsView());
      case orders:
        return MaterialPageRoute(builder: (_) => const OrderView());
      case categoryView:
        return MaterialPageRoute(builder: (_) => const CategoryView());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsView());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationView());
      case about:
        return MaterialPageRoute(builder: (_) => const AboutView());
      case filter:
        return MaterialPageRoute(builder: (_) => const FilterView());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
