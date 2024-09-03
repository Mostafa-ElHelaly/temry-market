import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/locale_keys.g.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_state.dart';

import 'package:temry_market/core/constant/images.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';
import 'package:temry_market/presentation/blocs/filter/filter_cubit.dart';
import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
import 'package:temry_market/presentation/views/main/category/category_view.dart';
import 'package:temry_market/presentation/widgets/alert_card.dart';
import 'package:temry_market/presentation/widgets/input_form_button.dart';
import 'package:temry_market/presentation/widgets/product_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

List<ImageProvider<Object>> image = [
  const AssetImage('assets/other_images/fresh.jpg'),
  const AssetImage('assets/other_images/matinted.jpg'),
  const AssetImage('assets/other_images/half cooked.jpg'),
  const AssetImage('assets/other_images/frozen.jpg'),
];
List<String> text = [
  StringManager.fresh,
  StringManager.marinated,
  StringManager.halfCooked,
  StringManager.frozen,
];

class _HomeViewState extends State<HomeView> {
  final ScrollController scrollController = ScrollController();

  void _scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollPercentage = 0.7;
    if (currentScroll > (maxScroll * scrollPercentage)) {
      if (context.read<ProductBloc>().state is ProductLoaded) {
        context.read<ProductBloc>().add(const GetMoreProducts());
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
                        child: Text(
                          "${state.signInModelResponse['data']['user']['first_name']} ${state.signInModelResponse['data']['user']['last_name']}",
                          style: const TextStyle(fontSize: 26),
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(
                        width: 8,
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
                      )
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Welcome,",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 36),
                          ),
                          Text(
                            "E-Shop mobile store",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 22),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRouter.signIn);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 24.0,
                            backgroundImage: AssetImage(kUserAvatar),
                            backgroundColor: AppColors.secondary,
                          ),
                        ),
                      )
                    ],
                  );
                }
              }),
            ),
            SizedBox(
              height: ConfigSize.defaultSize! * 2,
            ),
            InkWell(
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
                    itemCount: image.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(ConfigSize.defaultSize! * 0.5),
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
                                    image: image[index],
                                  ),
                                ),
                                // child: Image(
                                //   image: image[index],
                                //   width: ConfigSize.defaultSize! * 5,
                                //   height: ConfigSize.defaultSize! * 6,
                                // ),
                              ),
                              Text(
                                text[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: ConfigSize.defaultSize! * 1.1,
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
            ),
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
                              GetProducts(FilterProductParams(keyword: val))),
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
                child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                  //Result Empty and No Error
                  if (state is ProductLoaded && state.products.isEmpty) {
                    return const AlertCard(
                      image: kEmpty,
                      message: "Products not found!",
                    );
                  }
                  //Error and no preloaded data
                  if (state is ProductError && state.products.isEmpty) {
                    if (state.failure is NetworkFailure) {
                      return AlertCard(
                        image: kNoConnection,
                        message: "Network failure\nTry again!",
                        onClick: () {
                          context.read<ProductBloc>().add(GetProducts(
                              FilterProductParams(
                                  keyword: context
                                      .read<FilterCubit>()
                                      .searchController
                                      .text)));
                        },
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.failure is ServerFailure)
                          Image.asset(
                              'assets/status_image/internal-server-error.png'),
                        if (state.failure is CacheFailure)
                          Image.asset('assets/status_image/no-connection.png'),
                        const Text("Products not found!"),
                        IconButton(
                            onPressed: () {
                              context.read<ProductBloc>().add(GetProducts(
                                  FilterProductParams(
                                      keyword: context
                                          .read<FilterCubit>()
                                          .searchController
                                          .text)));
                            },
                            icon: const Icon(Icons.refresh)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      context
                          .read<ProductBloc>()
                          .add(const GetProducts(FilterProductParams()));
                    },
                    child: GridView.builder(
                      itemCount: state.products.length +
                          ((state is ProductLoading) ? 10 : 0),
                      controller: scrollController,
                      padding: EdgeInsets.only(
                          top: 18,
                          left: 20,
                          right: 20,
                          bottom: (80 + MediaQuery.of(context).padding.bottom)),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 20,
                      ),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        if (state.products.length > index) {
                          return ProductCard(
                            product: state.products[index],
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
                }))
          ],
        ),
      ),
    );
  }
}
