import 'package:flutter/material.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Address",
          style: TextStyle(
              fontSize: ConfigSize.defaultSize! * 2.6,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary),
        ),
        centerTitle: true,
      ),
    );
  }
}
