import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/presentation/blocs/category/category_bloc.dart';
import 'package:temry_market/presentation/blocs/category/category_event.dart';
import 'package:temry_market/presentation/blocs/category/category_state.dart';
import 'package:temry_market/presentation/blocs/product/product_event.dart';
import 'package:temry_market/presentation/blocs/product/product_state.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_bloc.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_event.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_state.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_state.dart';
import 'package:temry_market/core/constant/images.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';
import 'package:temry_market/presentation/blocs/filter/filter_cubit.dart';
import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
import 'package:temry_market/presentation/widgets/alert_card.dart';
import 'package:temry_market/presentation/widgets/input_form_button.dart';
import 'package:temry_market/presentation/widgets/product_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchcontroller = TextEditingController();

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
    BlocProvider.of<ProductBloc>(context).add(ProductEvent());
    BlocProvider.of<SearchProductsBloc>(context).add(SearchAllProductsEvent());
    BlocProvider.of<CategoryBloc>(context).add(CategoryEvent());

    super.initState();
  }

  List<ProductModel> _filteredItems = [];

  void _updateSearchQuery(String query, List<ProductModel> list) {
    setState(() {
      _filteredItems = list
          .where((item) =>
              item.name!.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (MediaQuery.of(context).padding.top + 10),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInSuccessState) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRouter.userProfile);
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
                            Navigator.of(context)
                                .pushNamed(AppRouter.userProfile);
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
            ),
            // SizedBox(
            //   height: ConfigSize.defaultSize! * 2,
            // ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategorySuccessState) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRouter.categoryView,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                      child: SizedBox(
                        height: ConfigSize.defaultSize! * 10,
                        child: ListView.builder(
                          itemCount: state.searchList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.all(ConfigSize.defaultSize! * 0.5),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                    border: Border.all(
                                      width: 1.5,
                                      color: AppColors.secondary,
                                    )),
                                height: ConfigSize.defaultSize! * 10.1,
                                width: ConfigSize.defaultSize! * 8.8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: ConfigSize.defaultSize! * 1,
                                    ),
                                    Container(
                                      height: ConfigSize.defaultSize! * 5.5,
                                      width: ConfigSize.defaultSize! * 5.5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            ConstantImageUrl.constantimageurl +
                                                state
                                                    .searchList[index].thumbnail
                                                    .toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      state.searchList[index].name.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              ConfigSize.defaultSize! * 1.1,
                                          color: AppColors.secondary),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Expanded(child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, basestate) {
                    if (basestate is ProductErrorState) {
                      return Text(basestate.failure.toString());
                    }

                    if (basestate is ProductSuccessState) {
                      return BlocBuilder<FilterCubit, FilterProductParams>(
                        builder: (context, state) {
                          return TextField(
                            autofocus: false,
                            controller: searchcontroller,
                            onSubmitted: (val) =>
                                context.read<SearchProductsBloc>().add(
                                      SearchAllProductsEvent(
                                        term: searchcontroller.text ?? '',
                                      ),
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
                                        padding:
                                            const EdgeInsets.only(right: 8),
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
                      );
                    } else {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.secondary,
                      ));
                    }
                  })),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: 55,
                    child: BlocBuilder<FilterCubit, FilterProductParams>(
                      builder: (context, state) {
                        return Badge(
                          alignment: AlignmentDirectional.topEnd,
                          label: Text(
                            context
                                .read<FilterCubit>()
                                .getFiltersCount()
                                .toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(221, 255, 0, 0)),
                          ),
                          isLabelVisible:
                              context.read<FilterCubit>().getFiltersCount() !=
                                  0,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: InputFormButton(
                            color: AppColors.secondary,
                            onClick: () {
                              Navigator.of(context).pushNamed(AppRouter.filter);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BlocBuilder<SearchProductsBloc, SearchProductsState>(
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 20,
                      ),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        const double borderRadius = 10;
                        if (state.SearchProducts.length > index) {
                          return Container(
                            height: ConfigSize.defaultSize! * 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(borderRadius),
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
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(borderRadius),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child:
                                        state.SearchProducts[index].thumbnail ==
                                                null
                                            ? Image.asset(
                                                'assets/other_images/logo.png')
                                            : Image(
                                                width: ConfigSize.screenWidth,
                                                image: NetworkImage(
                                                  ConstantImageUrl
                                                          .constantimageurl +
                                                      state
                                                          .SearchProducts[index]
                                                          .thumbnail
                                                          .toString(),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                ),
                                Expanded(
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
                                            state.SearchProducts[index].name
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize:
                                                  ConfigSize.defaultSize! * 1.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                ConfigSize.defaultSize! * 1,
                                          ),
                                          child: Text(
                                            '${state.SearchProducts[index].price} EPG',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AppColors.secondary,
                                              fontSize:
                                                  ConfigSize.defaultSize! * 2,
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
                                              const Icon(
                                                Icons.shopping_cart,
                                                color: AppColors.white,
                                              ),
                                              SizedBox(
                                                width:
                                                    ConfigSize.defaultSize! * 1,
                                              ),
                                              Text(
                                                'ADD TO Cart',
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                  fontSize:
                                                      ConfigSize.defaultSize! *
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}

//Result Empty and No Error
// if (state is ProductSuccessState &&
//     state.searchList.isEmpty) {
//   return const AlertCard(
//     image: kEmpty,
//     message: "Products not found!",
//   );
// }
// //Error and no preloaded data
// if (state is ProductErrorState &&
//     state.failure is NetworkFailure) {
//   if (state.failure is NetworkFailure) {
//     return AlertCard(
//       image: kNoConnection,
//       message: "Network failure\nTry again!",
//       onClick: () {
//         context.read<ProductBloc>().add(GetProductEvent());
//       },
//     );
//   }
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       if (state.failure is ServerFailure)
//         Image.asset(
//             'assets/status_image/internal-server-error.png'),
//       if (state.failure is CacheFailure)
//         Image.asset('assets/status_image/no-connection.png'),
//       const Text("Products not found!"),
//       IconButton(
//           onPressed: () {
//             context
//                 .read<ProductBloc>()
//                 .add(GetProductEvent());
//           },
//           icon: const Icon(Icons.refresh)),
//       SizedBox(
//         height: MediaQuery.of(context).size.height * 0.1,
//       )
//     ],
//   );
// }
// if (state is ProductSuccessState) {

// } else {
//   return const Center(child: CircularProgressIndicator());
// }
