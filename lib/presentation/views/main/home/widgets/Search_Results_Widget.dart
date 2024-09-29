import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';
import 'package:temry_market/core/constant/images.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
import 'package:temry_market/presentation/blocs/product/product_event.dart';
import 'package:temry_market/presentation/blocs/product/product_state.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_bloc.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_state.dart';
import 'package:temry_market/presentation/widgets/alert_card.dart';
import 'package:temry_market/presentation/widgets/product_card.dart';

class SearchResultsWidget extends StatefulWidget {
  const SearchResultsWidget({super.key});

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  final ScrollController scrollController = ScrollController();

  void _scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollPercentage = 0.7;
    if (currentScroll > (maxScroll * scrollPercentage)) {
      if (context.read<ProductBloc>().state is ProductSuccessState) {
        context.read<ProductBloc>().add(GetProductEvent());
      }
    }
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsBloc, SearchProductsState>(
        builder: (context, state) {
      if (state is SearchProductsErrorState) {
        return Text(state.errorMessage);
      }
      if (state is SearchProductsSuccessState) {
        return RefreshIndicator(
            onRefresh: () async {
              context.read<ProductBloc>().add(GetProductEvent());
            },
            child: GridView.builder(
              itemCount: state.SearchProducts.length +
                  ((state is ProductLoadingState) ? 10 : 0),
              controller: scrollController,
              padding: EdgeInsets.only(
                  top: 18,
                  left: 10,
                  right: 10,
                  bottom: (80 + MediaQuery.of(context).padding.bottom)),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                const double borderRadius = 10;

                if (state.SearchProducts.length > index &&
                    state.SearchProducts.isNotEmpty) {
                  return Container(
                    height: ConfigSize.defaultSize! * 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: const Offset(0, 2), // Shadow offset
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(borderRadius),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: state.SearchProducts[index].thumbnail == null
                                ? Image.asset('assets/other_images/logo.png')
                                : Image(
                                    width: ConfigSize.screenWidth,
                                    image: NetworkImage(
                                      ConstantImageUrl.constantimageurl +
                                          state.SearchProducts[index].thumbnail
                                              .toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: ConfigSize.defaultSize! * 1,
                                    vertical: ConfigSize.defaultSize! * 1,
                                  ),
                                  child: Text(
                                    state.SearchProducts[index].name.toString(),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: ConfigSize.defaultSize! * 1.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: ConfigSize.defaultSize! * 1,
                                  ),
                                  child: Text(
                                    '${state.SearchProducts[index].price} EPG',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.secondary,
                                      fontSize: ConfigSize.defaultSize! * 2,
                                      fontWeight: FontWeight.bold,
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
                                        BorderRadiusDirectional.vertical(
                                      bottom: Radius.circular(10),
                                    ),
                                  ),
                                  height: ConfigSize.defaultSize! * 4,
                                  width: ConfigSize.screenWidth,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.shopping_cart,
                                        color: AppColors.white,
                                      ),
                                      SizedBox(
                                        width: ConfigSize.defaultSize! * 1,
                                      ),
                                      Text(
                                        'ADD TO Cart',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize:
                                              ConfigSize.defaultSize! * 1.5,
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
                } else if (state.SearchProducts.isEmpty) {
                  return Text('No Products Found');
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.white,
                    child: const ProductCard(),
                  );
                }
              },
            ));
      } else if (state is SearchProductsErrorState &&
          state.errorMessage is NetworkFailure) {
        if (state.errorMessage is NetworkFailure) {
          return AlertCard(
            image: kNoConnection,
            message: "Network failure\nTry again!",
            onClick: () {
              context.read<ProductBloc>().add(GetProductEvent());
            },
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.secondary,
          ));
        }
      } else {
        return const Center(
            child: CircularProgressIndicator(
          color: AppColors.secondary,
        ));
      }
    });
  }
}
