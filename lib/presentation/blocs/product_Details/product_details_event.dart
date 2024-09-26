import 'package:equatable/equatable.dart';

class ProductDetailsEvent extends Equatable {
  final int product_id;

  const ProductDetailsEvent({required this.product_id});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetallProductDetailsEvent extends ProductDetailsEvent {
  GetallProductDetailsEvent({required super.product_id});
}
