import 'package:flutter/material.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard(
      {super.key,
      required this.borderRadius,
      this.image,
      required this.name,
      required this.price});
  final double borderRadius;
  final String? image;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(borderRadius),
            ),
            clipBehavior: Clip.antiAlias,
            child: image == null
                ? Image.asset('assets/other_images/logo.png')
                : Image(
                    width: ConfigSize.screenWidth,
                    image: NetworkImage(
                      ConstantImageUrl.constantimageurl + image.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ConfigSize.defaultSize! * 1,
                    vertical: ConfigSize.defaultSize! * 1,
                  ),
                  child: Text(
                    name.toString(),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ConfigSize.defaultSize! * 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ConfigSize.defaultSize! * 1,
                  ),
                  child: Text(
                    '${price} EPG',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: ConfigSize.defaultSize! * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadiusDirectional.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                  height: ConfigSize.defaultSize! * 4,
                  width: ConfigSize.screenWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: ConfigSize.defaultSize! * 1,
                      ),
                      Text(
                        'ADD TO Cart',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: ConfigSize.defaultSize! * 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
