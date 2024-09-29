import 'package:flutter/material.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/constant/config_size.dart';
import 'package:temry_market/core/constant/images.dart';
import 'package:temry_market/domain/entities/cart/cart_item.dart';
import 'package:temry_market/presentation/views/main/cart/widgets/Add_Remove_Item.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<CartItem> selectedCartItems = [];
  TextStyle style = TextStyle(fontSize: 28);
  BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(ConfigSize.defaultSize! * 0.5),
      border: Border.all(color: Colors.black, width: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            0,
            ConfigSize.defaultSize! * 2,
            0,
            ConfigSize.defaultSize! * 10,
          ),
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: false,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ConfigSize.defaultSize! * 2,
                  vertical: ConfigSize.defaultSize! * 1,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: const Offset(0, 2), // Shadow offset
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          test,
                          height: ConfigSize.defaultSize! * 15,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(ConfigSize.defaultSize! * 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Temry Thighs - 1kg'),
                              Text(
                                'Category Name',
                                style: TextStyle(color: AppColors.secondary),
                              ),
                              Text('1  *  110 Egp'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.end, // Center the row
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border_outlined,
                                      ),
                                    ),
                                  ),
                                  AddorRemoveItem(
                                      decoration: decoration, style: style),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
