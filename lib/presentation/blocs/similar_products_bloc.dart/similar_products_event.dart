import 'package:equatable/equatable.dart';

class GetSimilarProductsEvent extends Equatable {
  final int product_id;

  const GetSimilarProductsEvent({required this.product_id});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetallSimilarProductsEvent extends GetSimilarProductsEvent {
  GetallSimilarProductsEvent({required super.product_id});
}
