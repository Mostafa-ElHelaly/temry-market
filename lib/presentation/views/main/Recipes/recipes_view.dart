import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';
import 'package:temry_market/core/constant/images.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';
import 'package:temry_market/presentation/blocs/filter/filter_cubit.dart';

import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
import 'package:temry_market/presentation/blocs/product/product_event.dart';
import 'package:temry_market/presentation/blocs/respies/respies_bloc.dart';
import 'package:temry_market/presentation/blocs/respies/respies_event.dart';
import 'package:temry_market/presentation/blocs/respies/respies_state.dart';
import 'package:temry_market/presentation/widgets/alert_card.dart';
import 'package:temry_market/presentation/widgets/input_form_button.dart';
import 'package:temry_market/presentation/widgets/product_card.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  final ScrollController scrollController = ScrollController();

  // Original list of items
  final List<String> items = List.generate(20, (index) => 'Item $index');

  void _scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollPercentage = 0.7;
    if (currentScroll > (maxScroll * scrollPercentage)) {
      if (context.read<ProductBloc>().state is RecipesSuccessState) {
        context.read<ProductBloc>().add(GetProductEvent());
      }
    }
  }

  // List that will display filtered items
  List<String> filteredItems = [];

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    BlocProvider.of<RecipesBloc>(context).add(RecipesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recipes",
          style: TextStyle(
              fontSize: ConfigSize.defaultSize! * 2.6,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: BlocBuilder<FilterCubit, FilterProductParams>(
                      builder: (context, state) {
                        return TextField(
                          autofocus: false,
                          controller:
                              context.read<FilterCubit>().searchController,
                          onChanged: (val) => setState(() {}),
                          onSubmitted: (val) => context.read<ProductBloc>().add(
                                GetProductEvent(),
                              ),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 20, bottom: 22, top: 22),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Icon(Icons.search),
                              ),
                              suffixIcon: context
                                      .read<FilterCubit>()
                                      .searchController
                                      .text
                                      .isNotEmpty
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: IconButton(
                                          onPressed: () {
                                            context
                                                .read<FilterCubit>()
                                                .searchController
                                                .clear();
                                            context
                                                .read<FilterCubit>()
                                                .update(keyword: '');
                                          },
                                          icon: const Icon(Icons.clear)),
                                    )
                                  : null,
                              border: const OutlineInputBorder(),
                              hintText: "Search Product",
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 3.0),
                                  borderRadius: BorderRadius.circular(26)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(26),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 3.0),
                              )),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BlocBuilder<RecipesBloc, RecipesState>(
                builder: (context, state) {
                  if (state is RecipesSuccessState) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<RecipesBloc>().add(GetRecipesEvent());
                      },
                      child: GridView.builder(
                        itemCount: state.searchList.length +
                            ((state is RecipesLoadingState) ? 10 : 0),
                        controller: scrollController,
                        padding: EdgeInsets.only(
                            top: 18,
                            left: 10,
                            right: 10,
                            bottom:
                                (80 + MediaQuery.of(context).padding.bottom)),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20,
                        ),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          const double borderRadius = 10;
                          if (state.searchList.length > index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(borderRadius),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.1), // Shadow color
                                    spreadRadius: 0,
                                    blurRadius: 6,
                                    offset: const Offset(0, 2), // Shadow offset
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(borderRadius),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image(
                                        width: ConfigSize.screenWidth,
                                        image: NetworkImage(
                                          ConstantImageUrl.constantimageurl +
                                              state.searchList[index].thumbnail
                                                  .toString(),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  ConfigSize.defaultSize! * 1,
                                              vertical:
                                                  ConfigSize.defaultSize! * 1,
                                            ),
                                            child: Text(
                                              state.searchList[index].name
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    ConfigSize.defaultSize! *
                                                        1.5,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: AppColors.secondary,
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .vertical(
                                                bottom: Radius.circular(10),
                                              ),
                                            ),
                                            height: ConfigSize.defaultSize! * 4,
                                            width: ConfigSize.screenWidth,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'How To Make...',
                                                  style: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: ConfigSize
                                                            .defaultSize! *
                                                        1.5,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.white,
                              child: const ProductCard(),
                            );
                          }
                        },
                      ),
                    );
                  } else if (state is RecipesErrorState &&
                      state.failure is NetworkFailure) {
                    if (state.failure is NetworkFailure) {
                      return AlertCard(
                        image: kNoConnection,
                        message: "Network failure\nTry again!",
                        onClick: () {
                          context.read<ProductBloc>().add(GetProductEvent());
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
