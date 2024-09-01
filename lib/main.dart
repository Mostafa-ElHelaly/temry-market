import 'package:temry_market/core/constant/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/domain/usecases/user/sign_up_usecase.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignUp/sign_up_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignUp/sign_up_event.dart';

import 'core/constant/strings.dart';
import 'core/router/app_router.dart';
import 'domain/usecases/product/get_product_usecase.dart';
import 'presentation/blocs/cart/cart_bloc.dart';
import 'presentation/blocs/category/category_bloc.dart';
import 'presentation/blocs/delivery_info/delivery_info_action/delivery_info_action_cubit.dart';
import 'presentation/blocs/delivery_info/delivery_info_fetch/delivery_info_fetch_cubit.dart';
import 'presentation/blocs/filter/filter_cubit.dart';

import 'core/services/services_locator.dart' as di;
import 'presentation/blocs/home/navbar_cubit.dart';
import 'presentation/blocs/order/order_fetch/order_fetch_cubit.dart';
import 'presentation/blocs/product/product_bloc.dart';
import 'presentation/blocs/user/user_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavbarCubit(),
        ),
        BlocProvider(
          create: (context) => FilterCubit(),
        ),
        BlocProvider(
          create: (context) => di.sl<ProductBloc>()
            ..add(const GetProducts(FilterProductParams())),
        ),
        BlocProvider(
          create: (context) =>
              di.sl<CategoryBloc>()..add(const GetCategories()),
        ),
        BlocProvider(
          create: (context) => di.sl<CartBloc>()..add(const GetCart()),
        ),
        // BlocProvider(
        //   create: (context) => di.sl<UserBloc>()..add(CheckUser()),
        // ),
        BlocProvider(
          create: (context) => di.sl<SignUpBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SignInBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<DeliveryInfoActionCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              di.sl<DeliveryInfoFetchCubit>()..fetchDeliveryInfo(),
        ),
        BlocProvider(
          create: (context) => di.sl<OrderFetchCubit>()..getOrders(),
        ),
      ],
      child: OKToast(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.signIn,
          onGenerateRoute: AppRouter.onGenerateRoute,
          title: appTitle,
          // theme: AppTheme.lightTheme,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2500)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.black
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}
