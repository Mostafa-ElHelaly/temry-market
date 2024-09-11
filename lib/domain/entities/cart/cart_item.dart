import 'package:equatable/equatable.dart';

import 'package:temry_market/domain/entities/product/price_tag.dart';
import 'package:temry_market/domain/entities/product/product.dart';

class CartItem extends Equatable {
  final String? id;
  final Product? product;
  final PriceTag? priceTag;

  const CartItem({this.id, this.product, this.priceTag});

  @override
  List<Object?> get props => [id];
}
