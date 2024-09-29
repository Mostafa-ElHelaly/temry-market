import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/presentation/blocs/category/category_bloc.dart';
import 'package:temry_market/presentation/blocs/category/category_event.dart';
import 'package:temry_market/presentation/blocs/product/product_event.dart';
import 'package:temry_market/presentation/blocs/product/product_state.dart';
import 'package:temry_market/presentation/blocs/respies/respies_bloc.dart';
import 'package:temry_market/presentation/blocs/respies/respies_event.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_bloc.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_event.dart';
import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
import 'package:temry_market/presentation/views/main/home/widgets/Categories_Widget.dart';
import 'package:temry_market/presentation/views/main/home/widgets/Filter_Products_Widgets.dart';
import 'package:temry_market/presentation/views/main/home/widgets/Profile_Widget.dart';
import 'package:temry_market/presentation/views/main/home/widgets/Recipes_Widget.dart';
import 'package:temry_market/presentation/views/main/home/widgets/Search_Bar.dart';
import 'package:temry_market/presentation/views/main/home/widgets/Search_Results_Widget.dart';

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
    BlocProvider.of<RecipesBloc>(context).add(RecipesEvent());

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
            ProfileWidget(),
            SizedBox(
              height: ConfigSize.defaultSize! * 1.5,
            ),
            CategoriesWidget(),
            SizedBox(
              height: ConfigSize.defaultSize! * 1.5,
            ),
            RecipesWidget(),
            SizedBox(
              height: ConfigSize.defaultSize! * 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  SearchBarWidget(
                    searchcontroller: searchcontroller,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FilterProductsWidget()
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SearchResultsWidget()),
          ],
        ),
      ),
    );
  }
}
