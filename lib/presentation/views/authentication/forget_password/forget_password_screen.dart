import 'package:easy_localization/easy_localization.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/locale_keys.g.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/core/widgets/custom_text_field.dart';
import 'package:temry_market/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          StringManager.forgetPassword2.tr(),
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
              StringManager.forgetPasswordHint.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ConfigSize.defaultSize! * 1.5,
              ),
            ),
            SizedBox(
              height: ConfigSize.defaultSize! * 2,
            ),
            Text(
              StringManager.enterYourEmail.tr(),
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
              padding:
                  EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 3),
              child: MainButton(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.signIn);
                },
                title: StringManager.sendCode.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
