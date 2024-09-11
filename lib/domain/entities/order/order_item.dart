import 'package:equatable/equatable.dart';

import 'package:temry_market/domain/entities/product/price_tag.dart';
import 'package:temry_market/domain/entities/product/product.dart';

class OrderItem extends Equatable {
  final String id;
  final Product product;
  final PriceTag priceTag;
  final num price;
  final num quantity;

  const OrderItem({
    required this.id,
    required this.product,
    required this.priceTag,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
