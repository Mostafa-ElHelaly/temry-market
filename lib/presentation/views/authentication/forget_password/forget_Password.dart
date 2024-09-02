import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/core/widgets/custom_text_field.dart';
import 'package:temry_market/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:temry_market/core/widgets/snack_bar.dart';
import 'package:temry_market/domain/usecases/user/forget_password_usecase.dart';
import 'package:temry_market/presentation/blocs/user/forget_password_bloc/forget_password_bloc.dart';
import 'package:temry_market/presentation/blocs/user/forget_password_bloc/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRouter.signIn, (route) => false);
          } else if (state is ForgetPasswordErrorState) {
            errorSnackBar(context, state.failure.toString());
          } else if (state is ForgetPasswordLoadingState) {}
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.secondary,
              ),
            ),
            centerTitle: true,
            title: Text(
              'forgetyour password',
              // AppLocalizations.of(context)!.forgetyourpassword,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ConfigSize.defaultSize! * 2,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(ConfigSize.defaultSize! * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'forgetyour password',
                  // AppLocalizations.of(context)!.forgetpasswordhint,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ConfigSize.defaultSize! * 1.5,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                Text(
                  'enter your email',
                  // AppLocalizations.of(context)!.enteryouremail,
                  style: TextStyle(
                    fontSize: ConfigSize.defaultSize! * 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! - 5,
                ),
                CustomTextField(
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ConfigSize.defaultSize! * 3),
                  child: MainButton(
                    onTap: () {
                      BlocProvider.of<ForgetPasswordBloc>(context).add(
                          ForgetPasswordParams(email: emailController.text));
                    },
                    title: 'send code',

                    // AppLocalizations.of(context)!.sendcode,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
