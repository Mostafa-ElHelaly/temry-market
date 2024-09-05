class ProductModel {
  int? id;
  int? productGroupId;
  int? returnPolicyId;
  int? categoryId;
  int? brandId;
  int? wholesaleParentId;
  int? wholesaleParentQuantity;
  String? slug;
  String? sku;
  String? barcode;
  String? model;
  String? name;
  String? brief;
  String? desc;
  String? measure;
  String? icon;
  String? thumbnail;
  String? image;
  int? displayMultiplier;
  int? minOrderQuantity;
  int? stepOrderQuantity;
  int? maxOrderQuantity;
  int? minStock;
  int? packageWidth;
  int? packageHeight;
  int? packageLength;
  int? packageWeight;
  int? leadTimeFrom;
  int? leadTimeTo;
  String? perOrder;
  String? infiniteStock;
  String? visibleStock;
  String? active;
  String? deleted;
  String? delstamp;
  String? addstamp;
  String? updatestamp;
  int? price;
  int? cost;
  int? discount;
  int? quantity;
  String? tags;
  String? nameAr;
  String? briefAr;
  String? descAr;
  String? measureAr;

  ProductModel(
    jsonDecode, {
    this.id,
    this.productGroupId,
    this.returnPolicyId,
    this.categoryId,
    this.brandId,
    this.wholesaleParentId,
    this.wholesaleParentQuantity,
    this.slug,
    this.sku,
    this.barcode,
    this.model,
    this.name,
    this.brief,
    this.desc,
    this.measure,
    this.icon,
    this.thumbnail,
    this.image,
    this.displayMultiplier,
    this.minOrderQuantity,
    this.stepOrderQuantity,
    this.maxOrderQuantity,
    this.minStock,
    this.packageWidth,
    this.packageHeight,
    this.packageLength,
    this.packageWeight,
    this.leadTimeFrom,
    this.leadTimeTo,
    this.perOrder,
    this.infiniteStock,
    this.visibleStock,
    this.active,
    this.deleted,
    this.delstamp,
    this.addstamp,
    this.updatestamp,
    this.price,
    this.cost,
    this.discount,
    this.quantity,
    this.tags,
    this.nameAr,
    this.briefAr,
    this.descAr,
    this.measureAr,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productGroupId = json['product_group_id'];
    returnPolicyId = json['return_policy_id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    wholesaleParentId = json['wholesale_parent_id'];
    wholesaleParentQuantity = json['wholesale_parent_quantity'];
    slug = json['slug'];
    sku = json['sku'];
    barcode = json['barcode'];
    model = json['model'];
    name = json['name'];
    brief = json['brief'];
    desc = json['desc'];
    measure = json['measure'];
    icon = json['icon'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    displayMultiplier = json['display_multiplier'];
    minOrderQuantity = json['min_order_quantity'];
    stepOrderQuantity = json['step_order_quantity'];
    maxOrderQuantity = json['max_order_quantity'];
    minStock = json['min_stock'];
    packageWidth = json['package_width'];
    packageHeight = json['package_height'];
    packageLength = json['package_length'];
    packageWeight = json['package_weight'];
    leadTimeFrom = json['lead_time_from'];
    leadTimeTo = json['lead_time_to'];
    perOrder = json['per_order'];
    infiniteStock = json['infinite_stock'];
    visibleStock = json['visible_stock'];
    active = json['active'];
    deleted = json['deleted'];
    delstamp = json['delstamp'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    price = json['price'];
    cost = json['cost'];
    discount = json['discount'];
    quantity = json['quantity'];
    tags = json['tags'];
    nameAr = json['name_ar'];
    briefAr = json['brief_ar'];
    descAr = json['desc_ar'];
    measureAr = json['measure_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_group_id'] = this.productGroupId;
    data['return_policy_id'] = this.returnPolicyId;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['wholesale_parent_id'] = this.wholesaleParentId;
    data['wholesale_parent_quantity'] = this.wholesaleParentQuantity;
    data['slug'] = this.slug;
    data['sku'] = this.sku;
    data['barcode'] = this.barcode;
    data['model'] = this.model;
    data['name'] = this.name;
    data['brief'] = this.brief;
    data['desc'] = this.desc;
    data['measure'] = this.measure;
    data['icon'] = this.icon;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    data['display_multiplier'] = this.displayMultiplier;
    data['min_order_quantity'] = this.minOrderQuantity;
    data['step_order_quantity'] = this.stepOrderQuantity;
    data['max_order_quantity'] = this.maxOrderQuantity;
    data['min_stock'] = this.minStock;
    data['package_width'] = this.packageWidth;
    data['package_height'] = this.packageHeight;
    data['package_length'] = this.packageLength;
    data['package_weight'] = this.packageWeight;
    data['lead_time_from'] = this.leadTimeFrom;
    data['lead_time_to'] = this.leadTimeTo;
    data['per_order'] = this.perOrder;
    data['infinite_stock'] = this.infiniteStock;
    data['visible_stock'] = this.visibleStock;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['delstamp'] = this.delstamp;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['price'] = this.price;
    data['cost'] = this.cost;
    data['discount'] = this.discount;
    data['quantity'] = this.quantity;
    data['tags'] = this.tags;
    data['name_ar'] = this.nameAr;
    data['brief_ar'] = this.briefAr;
    data['desc_ar'] = this.descAr;
    data['measure_ar'] = this.measureAr;
    return data;
  }
}




















// class ProductModel extends Product {
//   const ProductModel({
//     required String id,
//     required String name,
//     required String description,
//     required List<PriceTagModel> priceTags,
//     required List<CategoryModel> categories,
//     required List<String> images,
//     required DateTime createdAt,
//     required DateTime updatedAt,
//   }) : super(
//           id: id,
//           name: name,
//           description: description,
//           priceTags: priceTags,
//           categories: categories,
//           images: images,
//           createdAt: createdAt,
//           updatedAt: updatedAt,
//         );

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["_id"],
//         name: json["name"],
//         description: json["description"],
//         priceTags: List<PriceTagModel>.from(
//             json["priceTags"].map((x) => PriceTagModel.fromJson(x))),
//         categories: List<CategoryModel>.from(
//             json["categories"].map((x) => CategoryModel.fromJson(x))),
//         images: List<String>.from(json["images"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "description": description,
//         "priceTags": List<dynamic>.from(
//             (priceTags as List<PriceTagModel>).map((x) => x.toJson())),
//         "categories": List<dynamic>.from(
//             (categories as List<CategoryModel>).map((x) => x.toJson())),
//         "images": List<dynamic>.from(images.map((x) => x)),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//       };

//   factory ProductModel.fromEntity(Product entity) => ProductModel(
//         id: entity.id,
//         name: entity.name,
//         description: entity.description,
//         priceTags: entity.priceTags
//             .map((priceTag) => PriceTagModel.fromEntity(priceTag))
//             .toList(),
//         categories: entity.categories
//             .map((category) => CategoryModel.fromEntity(category))
//             .toList(),
//         images: entity.images,
//         createdAt: entity.createdAt,
//         updatedAt: entity.updatedAt,
//       );
// }
