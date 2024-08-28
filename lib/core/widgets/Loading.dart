import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:flutter/material.dart';

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("PLease Wait"),
          content: Container(
              color: Colors.transparent,
              height: 50,
              child: const Center(
                  child: CircularProgressIndicator(
                color: AppColors.secondary,
              ))),
        );
      });
}
