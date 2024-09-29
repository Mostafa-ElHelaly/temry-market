import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/images.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_state.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInSuccessState) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRouter.userProfile);
                  },
                  child: SizedBox(
                    width: ConfigSize.defaultSize! * 12,
                    height: ConfigSize.defaultSize! * 12,
                    child: const Image(
                      image: AssetImage('assets/other_images/logo.png'),
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRouter.signIn);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: ConfigSize.defaultSize! * 5,
                          height: ConfigSize.defaultSize! * 5,
                          decoration: const BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 1, 114, 201),
                              Color.fromARGB(255, 0, 28, 49),
                            ]),
                          ),
                          child: Text(
                            "${state.signInModelResponse['data']['user']['first_name'].substring(0, 1).toUpperCase()}${state.signInModelResponse['data']['user']['last_name'].substring(0, 1).toUpperCase()}",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: ConfigSize.defaultSize! * 2.2,
                            ),
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "${state.signInModelResponse['data']['user']['first_name']}",
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: ConfigSize.defaultSize! * 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ConfigSize.defaultSize! * 2),
                  child: SizedBox(
                    width: ConfigSize.defaultSize! * 10,
                    height: ConfigSize.defaultSize! * 10,
                    child: const Image(
                      image: AssetImage('assets/other_images/logo.png'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRouter.userProfile);
                  },
                  child: const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage(kUserAvatar),
                    backgroundColor: AppColors.secondary,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
