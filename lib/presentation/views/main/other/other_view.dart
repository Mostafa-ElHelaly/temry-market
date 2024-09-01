import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_state.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/router/app_router.dart';
import '../../../widgets/other_item_card.dart';

class OtherView extends StatelessWidget {
  const OtherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInSuccessState) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRouter.userProfile,
                      );
                    },
                    child: Row(
                      children: [
                        // state.SignInModelResponse['image'] != null
                        //     ? CachedNetworkImage(
                        //         imageUrl: state.SignInModelResponse[].image!,
                        //         imageBuilder: (context, image) => CircleAvatar(
                        //           radius: 36.0,
                        //           backgroundImage: image,
                        //           backgroundColor: Colors.transparent,
                        //         ),
                        //       )
                        //     :
                        const CircleAvatar(
                          radius: 36.0,
                          backgroundImage: AssetImage(kUserAvatar),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${state.SignInModelResponse['data']['user']['first_name']} ${state.SignInModelResponse['data']['user']['last_name']}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(state.SignInModelResponse['data']['user']
                                ['email'])
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.signIn);
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 36.0,
                          backgroundImage: AssetImage(kUserAvatar),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Login in your account",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text("")
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 25),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return OtherItemCard(
                onClick: () {
                  if (state is SignInSuccessState) {
                    Navigator.of(context).pushNamed(
                      AppRouter.userProfile,
                      arguments:
                          state.SignInModelResponse['data']['user'].email,
                    );
                  } else {
                    Navigator.of(context).pushNamed(AppRouter.signIn);
                  }
                },
                title: "Profile",
              );
            },
          ),
          // BlocBuilder<UserBloc, UserState>(
          //   builder: (context, state) {
          //     if (state is UserLogged) {
          //       return Padding(
          //         padding: const EdgeInsets.only(top: 6),
          //         child: OtherItemCard(
          //           onClick: () {
          //             Navigator.of(context).pushNamed(AppRouter.orders);
          //           },
          //           title: "Orders",
          //         ),
          //       );
          //     } else {
          //       return const SizedBox();
          //     }
          //   },
          // ),
          // BlocBuilder<UserBloc, UserState>(
          //   builder: (context, state) {
          //     if (state is UserLogged) {
          //       return Padding(
          //         padding: const EdgeInsets.only(top: 6),
          //         child: OtherItemCard(
          //           onClick: () {
          //             Navigator.of(context)
          //                 .pushNamed(AppRouter.deliveryDetails);
          //           },
          //           title: "Delivery Info",
          //         ),
          //       );
          //     } else {
          //       return const SizedBox();
          //     }
          //   },
          // ),
          // const SizedBox(height: 6),
          // OtherItemCard(
          //   onClick: () {
          //     Navigator.of(context).pushNamed(AppRouter.settings);
          //   },
          //   title: "Settings",
          // ),
          // const SizedBox(height: 6),
          // OtherItemCard(
          //   onClick: () {
          //     Navigator.of(context).pushNamed(AppRouter.notifications);
          //   },
          //   title: "Notifications",
          // ),
          // const SizedBox(height: 6),
          // OtherItemCard(
          //   onClick: () {
          //     Navigator.of(context).pushNamed(AppRouter.about);
          //   },
          //   title: "About",
          // ),
          // const SizedBox(height: 6),
          // BlocBuilder<UserBloc, UserState>(
          //   builder: (context, state) {
          //     if (state is UserLogged) {
          //       return OtherItemCard(
          //         onClick: () {
          //           context.read<UserBloc>().add(SignOutUser());
          //           context.read<CartBloc>().add(const ClearCart());
          //           context
          //               .read<DeliveryInfoFetchCubit>()
          //               .clearLocalDeliveryInfo();
          //           context.read<OrderFetchCubit>().clearLocalOrders();
          //         },
          //         title: "Sign Out",
          //       );
          //     } else {
          //       return const SizedBox();
          //     }
          //   },
          // ),
          // SizedBox(height: (MediaQuery.of(context).padding.bottom + 50)),
        ],
      ),
    );
  }
}
