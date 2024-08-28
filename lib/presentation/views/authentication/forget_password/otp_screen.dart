import 'package:easy_localization/easy_localization.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/locale_keys.g.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/core/widgets/main_button.dart';
import 'package:temry_market/presentation/views/authentication/forget_password/counter_by_minute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {super.key,
      required this.first_name,
      required this.middle_name,
      required this.last_name,
      required this.birthdate,
      required this.email,
      required this.password,
      required this.mobile,
      required this.country_id,
      required this.education,
      required this.token});
  final String first_name;
  final String middle_name;
  final String last_name;
  final String birthdate;
  final String email;
  final String password;
  final String mobile;
  final String country_id;
  final String education;
  final int token;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final pinController = TextEditingController();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

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
              StringManager.pleaseEnterTheCode.tr(),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: ConfigSize.defaultSize! * 1.6,
              ),
            ),
            Text(
              "GlobaAdvice@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ConfigSize.defaultSize! * 1.6,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: ConfigSize.defaultSize! * 3,
              ),
              child: Pinput(
                controller: pinController,
                length: 6,
                defaultPinTheme: PinTheme(
                    width: ConfigSize.defaultSize! * 6,
                    height: ConfigSize.defaultSize! * 6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(ConfigSize.defaultSize!),
                      border: Border.all(color: Colors.grey),
                    )),
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value != null ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
              ),
            ),
            const CounterByMinute(),
            const SizedBox(
              height: 5,
            ),
            Text(
              StringManager.resendCode.tr(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ConfigSize.defaultSize! * 1.6,
                color: AppColors.secondary,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ConfigSize.defaultSize! * 3),
              child: MainButton(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.signIn);
                },
                title: StringManager.verify.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
