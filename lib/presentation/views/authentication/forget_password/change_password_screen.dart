import 'package:easy_localization/easy_localization.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/locale_keys.g.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/core/widgets/custom_text_field.dart';
import 'package:temry_market/core/widgets/main_button.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isVisible = true;
  bool isVisible1 = true;

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
            SizedBox(height: ConfigSize.defaultSize! * 2),
            Text(
              StringManager.password.tr(),
              style: TextStyle(
                fontSize: ConfigSize.defaultSize! * 1.6,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: ConfigSize.defaultSize! - 5,
            ),
            CustomTextField(
              controller: passwordController,
              inputType: TextInputType.text,
              obscureText: isVisible,
              suffix: InkWell(
                onTap: () {
                  {
                    isVisible = !isVisible;
                  }
                  setState(() {});
                },
                child: Icon(isVisible
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined),
              ),
            ),
            SizedBox(height: ConfigSize.defaultSize! * 2),
            Text(
              StringManager.confirmPassword.tr(),
              style: TextStyle(
                fontSize: ConfigSize.defaultSize! * 1.6,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: ConfigSize.defaultSize! - 5,
            ),
            CustomTextField(
              controller: confirmPasswordController,
              inputType: TextInputType.text,
              obscureText: isVisible1,
              suffix: InkWell(
                onTap: () {
                  {
                    isVisible1 = !isVisible1;
                  }
                  setState(() {});
                },
                child: Icon(isVisible1
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 3),
              child: MainButton(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.otpScreen);
                },
                title: StringManager.confirm.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
