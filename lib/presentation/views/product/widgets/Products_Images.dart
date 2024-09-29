import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
import 'package:temry_market/presentation/blocs/product/product_state.dart';
import 'package:temry_market/presentation/blocs/product_Details/product_details_bloc.dart';
import 'package:temry_market/presentation/blocs/product_Details/product_details_event.dart';
import 'package:temry_market/presentation/blocs/product_Details/product_details_state.dart';
import 'package:temry_market/presentation/views/product/pages/product_details_view.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  // ignore: library_private_types_in_public_api
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  void initState() {
    BlocProvider.of<ProductDetailsBloc>(context)
        .add(ProductDetailsEvent(product_id: widget.product.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsSuccessState) {
          return Column(
            children: [
              SizedBox(
                width: ConfigSize.screenWidth,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    ConstantImageUrl.constantimageurl +
                        widget.product.thumbnail.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ConfigSize.screenWidth! * 0.2,
                  ),
                  ...List.generate(
                    state.productsdetails.media!.length,
                    (index) => SmallProductImage(
                      isSelected: index == selectedImage,
                      press: () {
                        setState(() {
                          selectedImage = index;
                        });
                      },
                      image: ConstantImageUrl.constantimageurl +
                          state.productsdetails.media![index].image.toString(),
                    ),
                  ),
                ],
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
