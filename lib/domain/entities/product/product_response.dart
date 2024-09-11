import 'package:temry_market/domain/entities/product/pagination_meta_data.dart';
import 'package:temry_market/domain/entities/product/product.dart';

class ProductResponse {
  final List<Product> products;
  final PaginationMetaData paginationMetaData;

  ProductResponse({required this.products, required this.paginationMetaData});
}
