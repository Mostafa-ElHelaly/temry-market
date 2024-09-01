import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/presentation/blocs/home/navbar_cubit.dart';
import 'package:temry_market/presentation/blocs/order/order_fetch/order_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_state.dart';

import '../../../core/constant/images.dart';
import '../../../core/error/failures.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/usecases/user/sign_in_usecase.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/delivery_info/delivery_info_fetch/delivery_info_fetch_cubit.dart';
import '../../blocs/user/user_bloc.dart';
import '../../widgets/input_form_button.dart';
import '../../widgets/input_text_form_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        EasyLoading.dismiss();
        if (state is SignInLoadingState) {
          EasyLoading.show(status: 'Loading...');
        } else if (state is SignInSuccessState) {
          // context.read<CartBloc>().add(const GetCart());
          // context.read<DeliveryInfoFetchCubit>().fetchDeliveryInfo();
          // context.read<OrderFetchCubit>().getOrders();
          // context.read<NavbarCubit>().update(0);
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.home,
            ModalRoute.withName(''),
          );
        } else if (state is SignInErrorState) {
          if (state.failure is CredentialFailure) {
            EasyLoading.showError(state.failure.toString());
          } else {
            EasyLoading.showError("Error");
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize! * 2),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ConfigSize.defaultSize! * 14,
                  ),
                  SizedBox(
                      height: ConfigSize.defaultSize! * 10,
                      child: Image.asset(
                        kAppLogo,
                        color: AppColors.secondary,
                      )),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 5,
                  ),
                  // Text(
                  //   "Please enter \n your e-mail address and password \n to sign-in",
                  //   style: TextStyle(
                  //     fontSize: ConfigSize.defaultSize! * 1.8,
                  //     color: AppColors.textFourth,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  // const Spacer(),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 7,
                  ),
                  InputTextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    hint: 'Email',
                    validation: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InputTextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.go,
                    hint: 'Password',
                    isSecureField: true,
                    validation: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<SignInBloc>(context).add(SignInParams(
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                      }
                    },
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 1,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouter.forgetPasswordScreen);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: ConfigSize.defaultSize! * 1.4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 2.4,
                  ),
                  InputFormButton(
                    color: AppColors.secondary,
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<SignInBloc>(context).add(SignInParams(
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                      }
                    },
                    titleText: 'Sign In',
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 1,
                  ),
                  // InputFormButton(
                  //   color: AppColors.secondary,
                  //   onClick: () {
                  //     Navigator.of(context).pop();
                  //   },
                  //   titleText: 'Back',
                  // ),
                  AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        'Hello, Flutter!',
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    totalRepeatCount: 2,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: false,
                    stopPauseOnTap: true,
                  ),

                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account! ',
                          style: TextStyle(
                            fontSize: ConfigSize.defaultSize! * 1.4,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRouter.signUp);
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: ConfigSize.defaultSize! * 1.4,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
