import 'package:flutter/material.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';

class AddorRemoveItem extends StatelessWidget {
  const AddorRemoveItem(
      {super.key, required this.decoration, required this.style});
  final BoxDecoration decoration;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: ConfigSize.defaultSize! * 4,
      width: ConfigSize.defaultSize! * 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center inner row
        children: [
          Container(
            child: Text(
              "-",
              style: style.copyWith(color: AppColors.lightRed),
            ),
          ),
          VerticalDivider(
            thickness: 1,
            color: AppColors.textFourth,
          ),
          Container(
            child: Text(
              '1',
              style: style.copyWith(fontSize: 20),
            ),
          ),
          VerticalDivider(
            thickness: 1,
            color: AppColors.textFourth,
          ),
          Container(
            child: Text(
              "+",
              style: style.copyWith(color: AppColors.lightGreen),
            ),
          ),
        ],
      ),
    );
  }
}
