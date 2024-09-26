import 'package:flutter/material.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/data/models/Recipes/Recipes_model.dart';

class PageViewItem extends StatelessWidget {
  PageViewItem({
    super.key,
    required this.textStyle,
    required this.recipesdetails,
    required this.label,
  });
  final TextStyle textStyle;
  final RecipesModel recipesdetails;
  final String label;

  @override
  Widget build(BuildContext context) {
    print(recipesdetails.ingredients);
    print(recipesdetails.preparations);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: ConfigSize.defaultSize! * 2),
        Text(
          label,
          style: textStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: ConfigSize.defaultSize! * 2),
        Padding(
          padding: EdgeInsets.all(ConfigSize.defaultSize! * 0.5),
          child: Text(
              '• ${label == "ingredients" ? recipesdetails.ingredients! : recipesdetails.preparations ?? ''}',
              style: textStyle),
        )
      ],
    );
  }
}
