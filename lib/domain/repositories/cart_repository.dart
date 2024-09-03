import 'package:dartz/dartz.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/domain/entities/cart/cart_item.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartItem>>> getCachedCart();
  Future<Either<Failure, List<CartItem>>> syncCart();
  Future<Either<Failure, CartItem>> addToCart(CartItem params);
  Future<Either<Failure, bool>> deleteFormCart();
  Future<Either<Failure, bool>> clearCart();
}
