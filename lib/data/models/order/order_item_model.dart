import 'package:temry_market/domain/entities/product/product.dart';

import 'package:temry_market/domain/entities/order/order_item.dart';
import 'package:temry_market/data/models/product/price_tag_model.dart';
import 'package:temry_market/data/models/product/product_model.dart';

class OrderItemModel extends OrderItem {
  const OrderItemModel({
    required String id,
    required Product product,
    required PriceTagModel priceTag,
    required num price,
    required num quantity,
  }) : super(
          id: id,
          product: product,
          priceTag: priceTag,
          price: price,
          quantity: quantity,
        );

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
      id: json["_id"],
      product: json["Product"],
      priceTag: PriceTagModel.fromJson(json["priceTag"]),
      price: json["price"],
      quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": (product as ProductModel).toJson(),
        "priceTag": (priceTag as PriceTagModel).toJson(),
        "price": price,
        "quantity": quantity,
      };

  Map<String, dynamic> toJsonBody() => {
        "_id": id,
        "product": product.id,
        "priceTag": priceTag.id,
        "price": price,
        "quantity": quantity,
      };

  factory OrderItemModel.fromEntity(OrderItem entity) => OrderItemModel(
        id: entity.id,
        product: entity.product,
        priceTag: PriceTagModel.fromEntity(entity.priceTag),
        price: entity.price,
        quantity: entity.quantity,
      );
}
