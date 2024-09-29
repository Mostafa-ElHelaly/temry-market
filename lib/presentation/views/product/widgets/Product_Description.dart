import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/constant_image_url.dart';
import 'package:temry_market/data/models/product/product_model.dart';
import 'package:temry_market/presentation/blocs/product_Details/product_details_bloc.dart';
import 'package:temry_market/presentation/blocs/product_Details/product_details_event.dart';
import 'package:temry_market/presentation/blocs/product_Details/product_details_state.dart';
import 'package:temry_market/presentation/views/product/widgets/Product_Card.dart';

class ProductDescription extends StatefulWidget {
  ProductDescription({
    super.key,
    this.pressOnSeeMore,
    required this.product,
  });

  final GestureTapCallback? pressOnSeeMore;
  final ProductModel product;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  void initState() {
    BlocProvider.of<ProductDetailsBloc>(context)
        .add(ProductDetailsEvent(product_id: widget.product.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            widget.product.name.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: ConfigSize.defaultSize! * 1.8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '${widget.product.price} EPG',
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: ConfigSize.defaultSize! * 2.6,
              fontWeight: FontWeight.bold,
            ),

            // Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6F9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.string(
              '''<svg width="18" height="16" viewBox="0 0 18 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M16.5266 8.61383L9.27142 15.8877C9.12207 16.0374 8.87889 16.0374 8.72858 15.8877L1.47343 8.61383C0.523696 7.66069 0 6.39366 0 5.04505C0 3.69644 0.523696 2.42942 1.47343 1.47627C2.45572 0.492411 3.74438 0 5.03399 0C6.3236 0 7.61225 0.492411 8.59454 1.47627C8.81857 1.70088 9.18143 1.70088 9.40641 1.47627C11.3691 -0.491451 14.5629 -0.491451 16.5266 1.47627C17.4763 2.42846 18 3.69548 18 5.04505C18 6.39366 17.4763 7.66165 16.5266 8.61383Z" fill="#DBDEE4"/>
</svg>
''',
              colorFilter:
                  ColorFilter.mode(const Color(0xFFDBDEE4), BlendMode.srcIn),
              height: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            'Description',
            maxLines: 3,
            style: TextStyle(
              fontSize: ConfigSize.defaultSize! * 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: ConfigSize.defaultSize! * 1.5,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            widget.product.desc == null
                ? 'Description :'
                : widget.product.desc.toString(),
            maxLines: 3,
          ),
        ),
        SizedBox(
          height: ConfigSize.defaultSize! * 2,
        ),
        BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsSuccessState) {
              return Container(
                height: ConfigSize.defaultSize! * 25,
                // width: ConfigSize.defaultSize! * 20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.productsdetails.similar?.length ?? 3,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ConfigSize.defaultSize! * 1),
                        child: Container(
                            width: ConfigSize.defaultSize! * 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.1), // Shadow color
                                  spreadRadius: 0,
                                  blurRadius: 6,
                                  offset: const Offset(0, 2), // Shadow offset
                                ),
                              ],
                            ),
                            child: CustomProductCard(
                                pricesize: ConfigSize.defaultSize! * 1.2,
                                buttonheight: ConfigSize.defaultSize! * 2,
                                borderRadius: 10,
                                name: state
                                        .productsdetails.similar![index].name ??
                                    'null',
                                price: state
                                    .productsdetails.similar![index].price
                                    .toString(),
                                image: state.productsdetails.similar![index]
                                    .thumbnail)));
                  },
                ),
              );
            }
            if (state is ProductDetailsErrorState) {
              return Center(child: Text(state.failure.toString()));
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.secondary,
              ));
            }
          },
        )
      ],
    );
  }
}
