import 'package:flutter/material.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/data/models/Recipes/Recipes_model.dart';

class PageViewItem extends StatelessWidget {
  PageViewItem({
    super.key,
    required this.textStyle,
    required this.recipesdetails,
    required this.type,
  });
  final TextStyle textStyle;
  final RecipesModel recipesdetails;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: ConfigSize.defaultSize! * 2),
        Text(
          type == "ingredients" ? 'Ingredients' : 'Preparations',
          style: textStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: ConfigSize.defaultSize! * 2),
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: type == "ingredients"
              ? recipesdetails.ingredients?.length ?? 0
              : recipesdetails.preparations?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(ConfigSize.defaultSize! * 0.5),
              child: Text(
                  '• ${type == "ingredients" ? recipesdetails.ingredients![index] : recipesdetails.preparations?[index] ?? ''}',
                  style: textStyle),
            );
          },
        )
      ],
    );
  }
}
