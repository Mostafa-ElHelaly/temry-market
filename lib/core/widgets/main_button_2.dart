import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:flutter/material.dart';

class MainButton2 extends StatelessWidget {
  final Function() onTap;
  final Color? color;
  final Color? textColor;
  final Widget? child;

  const MainButton2({
    super.key,
    required this.onTap,
    this.color,
    this.textColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ConfigSize.screenWidth!,
        height: ConfigSize.defaultSize! * 5,
        decoration: BoxDecoration(
          color: color ?? AppColors.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: child),
      ),
    );
  }
}
