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

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Products",
          style: TextStyle(
              fontSize: ConfigSize.defaultSize! * 2.2,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary),
        ),
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
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
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRouter.productDetails,
                );
              },
              child: Padding(
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
                            bottom:
                                (80 + MediaQuery.of(context).padding.bottom)),
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
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(borderRadius),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: state.SearchProducts[index]
                                                  .thumbnail ==
                                              null
                                          ? Image.asset(
                                              'assets/other_images/logo.png')
                                          : Image(
                                              width: ConfigSize.screenWidth,
                                              image: NetworkImage(
                                                ConstantImageUrl
                                                        .constantimageurl +
                                                    state.SearchProducts[index]
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
                                                    ConfigSize.defaultSize! *
                                                        1.5,
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
                                                      ConfigSize.defaultSize! *
                                                          1,
                                                ),
                                                Text(
                                                  'ADD TO Cart',
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
            ),
          ],
        ),
      ),
    );
  }
}

// Result Empty and No Error
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



















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // TODO: add flutter_svg package to pubspec.yaml
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:temry_market/core/constant/colors%20copy.dart';
// import 'package:temry_market/core/constant/config_size.dart';
// import 'package:temry_market/core/constant/constant_image_url.dart';
// import 'package:temry_market/core/router/app_router.dart';
// import 'package:temry_market/data/models/product/product_model.dart';
// import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
// import 'package:temry_market/presentation/blocs/product/product_state.dart';

// class ProductsScreen extends StatelessWidget {
//   const ProductsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Products",
//           style: TextStyle(
//               fontSize: ConfigSize.defaultSize! * 2.2,
//               fontWeight: FontWeight.bold,
//               color: AppColors.secondary),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             style: ElevatedButton.styleFrom(
//               shape: const CircleBorder(),
//               padding: EdgeInsets.zero,
//               elevation: 0,
//               backgroundColor: Colors.white,
//             ),
//             child: const Icon(
//               Icons.arrow_back_ios_new,
//               color: Colors.black,
//               size: 20,
//             ),
//           ),
//         ),
//       ),
//       body: BlocBuilder<ProductBloc, ProductState>(
//         builder: (context, state) {
//           if (state is ProductSuccessState) {
//             return SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: GridView.builder(
//                   itemCount: state.searchList.length,
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 200,
//                     childAspectRatio: 0.7,
//                     mainAxisSpacing: 20,
//                     crossAxisSpacing: 16,
//                   ),
//                   itemBuilder: (context, index) => ProductCard(
//                     onPress: () {
//                       Navigator.of(context).pushNamed(
//                         AppRouter.productDetails,
//                       );
//                     },
//                     product: state.searchList[index],
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     super.key,
//     this.width = 140,
//     this.aspectRetio = 1.02,
//     required this.product,
//     required this.onPress,
//   });

//   final double width, aspectRetio;
//   final ProductModel product;
//   final VoidCallback onPress;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductBloc, ProductState>(
//       builder: (context, state) {
//         if (state is ProductSuccessState) {
//           return SizedBox(
//             width: width,
//             child: GestureDetector(
//               onTap: onPress,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AspectRatio(
//                     aspectRatio: 1.02,
//                     child: Container(
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF979797).withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Image.network(
//                         ConstantImageUrl.constantimageurl +
//                             state.searchList.first.thumbnail.toString(),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     state.searchList.first.name.toString(),
//                     style: Theme.of(context).textTheme.bodyMedium,
//                     maxLines: 2,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '${state.searchList.first.price} EPG',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.secondary,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

// class Product {
//   final int id;
//   final String title, description;
//   final List<String> images;
//   final List<Color> colors;
//   final double rating, price;
//   final bool isFavourite, isPopular;

//   Product({
//     required this.id,
//     required this.images,
//     required this.colors,
//     this.rating = 0.0,
//     this.isFavourite = false,
//     this.isPopular = false,
//     required this.title,
//     required this.price,
//     required this.description,
//   });
// }

// Our demo Products

// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: ["https://i.postimg.cc/c19zpJ6f/Image-Popular-Product-1.png"],
//     colors: [
//       AppColors.secondary,
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Wireless Controller for PS4™",
//     price: 64.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: [
//       "https://i.postimg.cc/CxD6nH74/Image-Popular-Product-2.png",
//     ],
//     colors: [
//       AppColors.secondary,
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Nike Sport White - Man Pant",
//     price: 50.5,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: [
//       "https://i.postimg.cc/1XjYwvbv/glap.png",
//     ],
//     colors: [
//       AppColors.secondary,
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     images: [
//       "https://i.postimg.cc/d1QWXMYW/Image-Popular-Product-3.png",
//     ],
//     colors: [
//       AppColors.secondary,
//       const Color(0xFF836DB8),
//       const Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: description,
//     rating: 4.1,
//     isFavourite: false,
//     isPopular: true,
//   ),
// ];

// const heartIcon =
//     '''<svg width="18" height="16" viewBox="0 0 18 16" fill="none" xmlns="http://www.w3.org/2000/svg">
// <path fill-rule="evenodd" clip-rule="evenodd" d="M16.5266 8.61383L9.27142 15.8877C9.12207 16.0374 8.87889 16.0374 8.72858 15.8877L1.47343 8.61383C0.523696 7.66069 0 6.39366 0 5.04505C0 3.69644 0.523696 2.42942 1.47343 1.47627C2.45572 0.492411 3.74438 0 5.03399 0C6.3236 0 7.61225 0.492411 8.59454 1.47627C8.81857 1.70088 9.18143 1.70088 9.40641 1.47627C11.3691 -0.491451 14.5629 -0.491451 16.5266 1.47627C17.4763 2.42846 18 3.69548 18 5.04505C18 6.39366 17.4763 7.66165 16.5266 8.61383Z" fill="#DBDEE4"/>
// </svg>
// ''';

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
