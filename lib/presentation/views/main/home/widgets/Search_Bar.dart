import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';
import 'package:temry_market/presentation/blocs/filter/filter_cubit.dart';
import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
import 'package:temry_market/presentation/blocs/product/product_event.dart';
import 'package:temry_market/presentation/blocs/product/product_state.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_bloc.dart';
import 'package:temry_market/presentation/blocs/search_product_bloc/search_product_event.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, required this.searchcontroller});
  final TextEditingController searchcontroller;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
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
    return Expanded(child:
        BlocBuilder<ProductBloc, ProductState>(builder: (context, basestate) {
      if (basestate is ProductErrorState) {
        return Text(basestate.failure.toString());
      }

      if (basestate is ProductSuccessState) {
        return BlocBuilder<FilterCubit, FilterProductParams>(
          builder: (context, state) {
            return TextField(
              autofocus: false,
              controller: widget.searchcontroller,
              onSubmitted: (val) => context.read<SearchProductsBloc>().add(
                    SearchAllProductsEvent(
                      term: widget.searchcontroller.text,
                    ),
                  ),
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 20, bottom: 22, top: 22),
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
                                context.read<FilterCubit>().update(keyword: '');
                              },
                              icon: const Icon(Icons.clear)),
                        )
                      : null,
                  border: const OutlineInputBorder(),
                  hintText: "Search Product",
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0),
                      borderRadius: BorderRadius.circular(26)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 3.0),
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
    }));
  }
}
