import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:temry_market/core/constant/config_size.dart';

import '../../../core/constant/images.dart';
import '../../../core/error/failures.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/usecases/user/sign_up_usecase.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../widgets/input_form_button.dart';
import '../../widgets/input_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        EasyLoading.dismiss();
        if (state is UserLoading) {
          EasyLoading.show(status: 'Loading...');
        } else if (state is UserLogged) {
          context.read<CartBloc>().add(const GetCart());
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.signIn,
            ModalRoute.withName(''),
          );
        } else if (state is UserLoggedFail) {
          if (state.failure is CredentialFailure) {
            EasyLoading.showError("Username/Password Wrong!");
          } else {
            EasyLoading.showError("Error");
          }
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize! * 2),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ConfigSize.defaultSize! * 5,
                  ),
                  SizedBox(
                      height: ConfigSize.defaultSize! * 8,
                      child: Image.asset(
                        kAppLogo,
                        color: AppColors.secondary,
                      )),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 6,
                  ),
                  // const Text(
                  //   "Please use your e-mail address to crate a new account",
                  //   style: TextStyle(fontSize: 16, color: Colors.grey),
                  //   textAlign: TextAlign.center,
                  // ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  InputTextFormField(
                    controller: firstNameController,
                    hint: 'First Name',
                    textInputAction: TextInputAction.next,
                    validation: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 1.2,
                  ),
                  InputTextFormField(
                    controller: lastNameController,
                    hint: 'Last Name',
                    textInputAction: TextInputAction.next,
                    validation: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 1.2,
                  ),
                  InputTextFormField(
                    controller: emailController,
                    hint: 'Email',
                    textInputAction: TextInputAction.next,
                    validation: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 1.2,
                  ),
                  InputTextFormField(
                    controller: phoneController,
                    hint: 'Phone Number',
                    textInputAction: TextInputAction.next,
                    validation: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 1.2,
                  ),
                  InputTextFormField(
                    controller: passwordController,
                    hint: 'Password',
                    textInputAction: TextInputAction.next,
                    isSecureField: true,
                    validation: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 1.2,
                  ),
                  InputTextFormField(
                    controller: confirmPasswordController,
                    hint: 'Confirm Password',
                    isSecureField: true,
                    textInputAction: TextInputAction.go,
                    validation: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'This field can\'t be empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      if (_formKey.currentState!.validate()) {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                        } else {
                          context.read<UserBloc>().add(
                                SignUpUser(
                                  SignUpParams(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    mobile: phoneController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 4,
                  ),
                  InputFormButton(
                    color: AppColors.secondary,
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                        } else {
                          context.read<UserBloc>().add(
                                SignUpUser(
                                  SignUpParams(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    mobile: phoneController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        }
                      }
                    },
                    titleText: 'Sign Up',
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 1,
                  ),
                  InputFormButton(
                    color: AppColors.secondary,
                    onClick: () {
                      Navigator.of(context).pop();
                    },
                    titleText: 'Back',
                  ),
                  SizedBox(
                    height: ConfigSize.defaultSize! * 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
