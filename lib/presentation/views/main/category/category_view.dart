import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';
import 'package:temry_market/core/router/app_router.dart';

import 'package:temry_market/presentation/blocs/category/category_bloc.dart';
import 'package:temry_market/presentation/blocs/category/category_event.dart';
import 'package:temry_market/presentation/blocs/category/category_state.dart';
import 'package:temry_market/presentation/views/product/pages/product_list_view.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final TextEditingController _textEditingController = TextEditingController();
  // Original list of items
  final List<String> items = List.generate(20, (index) => 'Item $index');

  // List that will display filtered items
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all items
    filteredItems = items;
  }

  // Function to handle search input changes
  void filterItems(String query) {
    setState(() {
      // Update the filtered list based on the query
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Category",
          style: TextStyle(
              fontSize: ConfigSize.defaultSize! * 2.2,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ConfigSize.defaultSize! * 2),
        child: Column(
          children: [
            SizedBox(
              height: (ConfigSize.defaultSize! * 1),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: TextField(
                controller: _textEditingController,
                autofocus: false,
                // onSubmitted: (val) {
                //   context.read<CategoryBloc>().add(GetCategoryEvent());
                // },
                onChanged: filterItems,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 20, bottom: 22, top: 22),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.search),
                    ),
                    suffixIcon: _textEditingController.text.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _textEditingController.clear();
                                    context
                                        .read<CategoryBloc>()
                                        .add(GetCategoryEvent());
                                  });
                                },
                                icon: const Icon(Icons.clear)),
                          )
                        : null,
                    border: const OutlineInputBorder(),
                    hintText: "Search Category",
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
              ),
            ),
            Expanded(
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategorySuccessState) {
                    return Padding(
                      padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                      child: SizedBox(
                        height: ConfigSize.defaultSize! * 10,
                        child: GridView.builder(
                          itemCount: state.searchList.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.all(ConfigSize.defaultSize! * 0.5),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductsScreen(
                                            categoryId:
                                                state.searchList[index].id,
                                          )));
                                },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: ConfigSize.defaultSize! * 1,
                                      ),
                                      Container(
                                        height: ConfigSize.defaultSize! * 11,
                                        width: ConfigSize.defaultSize! * 11,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              ConstantImageUrl
                                                      .constantimageurl +
                                                  state.searchList[index]
                                                      .thumbnail
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
                                                ConfigSize.defaultSize! * 2,
                                            color: AppColors.secondary),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 12.0, // Space between columns
                            mainAxisSpacing: 12.0, // Space between rows
                            childAspectRatio: 1, // Aspect ratio of each item
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(
              height: ConfigSize.defaultSize! * 10,
            ),
          ],
        ),
      ),
    );
  }
}
