import 'package:equatable/equatable.dart';
import 'package:temry_market/data/models/category/category_model.dart';

import 'package:temry_market/domain/entities/category/category.dart';
import 'package:temry_market/domain/entities/product/price_tag.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final List<PriceTag> priceTags;
  final List<CategoryModel> categories;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.priceTags,
    required this.categories,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id];
}
