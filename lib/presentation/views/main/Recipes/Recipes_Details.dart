import 'package:flutter/material.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';
import 'package:temry_market/core/widgets/Custom_Appbar.dart';
import 'package:temry_market/data/models/Recipes/Recipes_model.dart';
import 'package:temry_market/presentation/views/main/Recipes/Recepie_Page_Item.dart';
import 'package:temry_market/presentation/views/main/Recipes/Recipes_Tab_Bar_View.dart';

class RecipesDetailsView extends StatefulWidget {
  RecipesDetailsView({super.key, required this.recipesdetails});
  final RecipesModel recipesdetails;

  @override
  State<RecipesDetailsView> createState() => _RecipesDetailsViewState();
}

class _RecipesDetailsViewState extends State<RecipesDetailsView> {
  TextStyle textStyle = TextStyle(
      fontSize: ConfigSize.defaultSize! * 2,
      fontWeight: FontWeight.bold,
      color: AppColors.secondary);
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, false),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 2),
          child: Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  widget.recipesdetails.name.toString(),
                  style: textStyle,
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(ConfigSize.defaultSize! * 2),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image(
                    width: ConfigSize.screenWidth,
                    image: NetworkImage(
                      ConstantImageUrl.constantimageurl +
                          widget.recipesdetails.thumbnail.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: ConfigSize.defaultSize! * 2),
                Divider(
                  color: AppColors.secondary,
                  thickness: ConfigSize.defaultSize! * 0.3,
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 80,
                  child: RecepisDetailsPageView(
                    pageController: _pageController,
                    recipesdetails: widget.recipesdetails,
                    textStyle: textStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
