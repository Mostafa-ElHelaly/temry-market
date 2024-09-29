import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/presentation/blocs/respies/respies_bloc.dart';
import 'package:temry_market/presentation/blocs/respies/respies_state.dart';

class RecipesWidget extends StatelessWidget {
  const RecipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        if (state is RecipesSuccessState) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRouter.categoryView,
              );
            },
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize! * 1),
              child: SizedBox(
                height: ConfigSize.defaultSize! * 12,
                child: ListView.builder(
                  itemCount: state.searchList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ConfigSize.defaultSize! * 0.6),
                      child: Column(
                        children: [
                          Container(
                            width: ConfigSize.defaultSize! * 8,
                            height: ConfigSize.defaultSize! * 8,

                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(50),
                                border: Border.all(
                                  width: 1.5,
                                  color: AppColors.secondary,
                                )),

                            child: Container(
                              height: ConfigSize.defaultSize! * 5.5,
                              width: ConfigSize.defaultSize! * 5.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    ConstantImageUrl.constantimageurl +
                                        state.searchList[index].thumbnail
                                            .toString(),
                                  ),
                                ),
                              ),
                            ),
                            // Text(
                            //   state.searchList[index].name
                            //       .toString(),
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize:
                            //           ConfigSize.defaultSize! * 1.1,
                            //       color: AppColors.secondary),
                            // ),
                          ),
                          SizedBox(
                            height: ConfigSize.defaultSize! * 1,
                          ),
                          Text(
                            state.searchList[index].name
                                .toString()
                                .split(' ')
                                .first,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ConfigSize.defaultSize! * 1.5,
                                color: AppColors.secondary),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
