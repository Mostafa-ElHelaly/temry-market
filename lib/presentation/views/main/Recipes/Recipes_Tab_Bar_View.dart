// import 'package:flutter/material.dart';
// import 'package:temry_market/core/constant/config_size.dart';
// import 'package:temry_market/data/models/Recipes/Recipes_model.dart';
// import 'package:temry_market/presentation/views/main/Recipes/Recepie_Page_Item.dart';

// class RecepisDetailsPageView extends StatelessWidget {
//   RecepisDetailsPageView(
//       {super.key,
//       required this.textStyle,
//       required this.recipesdetails,
//       this.widget,
//       required this.pageController});
//   final TextStyle textStyle;
//   final RecipesModel recipesdetails;
//   final Widget? widget;
//   final PageController pageController;

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: pageController,
//       scrollDirection: Axis.horizontal,
//       itemCount: 2,
//       itemBuilder: (context, index) {
//         return PageViewItem(
//             textStyle: textStyle,
//             recipesdetails: recipesdetails,
//             type: index == 1 ? 'ingredients' : 'preparations');
//       },
//     );
//   }
// }
