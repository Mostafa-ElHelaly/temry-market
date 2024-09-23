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
  String? perOrder;
  String? infiniteStock;
  String? visibleStock;
  String? active;
  String? deleted;
  String? delstamp;
  String? addstamp;
  String? updatestamp;
  double? price;
  double? cost;
  double? discount;
  int? quantity;
  String? tags;
  String? nameAr;
  String? briefAr;
  String? descAr;
  String? measureAr;

  ProductModel({
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
    id = _parseInt(json['id']);
    productGroupId = _parseInt(json['product_group_id']);
    returnPolicyId = _parseInt(json['return_policy_id']);
    categoryId = _parseInt(json['category_id']);
    brandId = _parseInt(json['brand_id']);
    wholesaleParentId = _parseInt(json['wholesale_parent_id']);
    wholesaleParentQuantity = _parseInt(json['wholesale_parent_quantity']);
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
    perOrder = json['per_order'];
    infiniteStock = json['infinite_stock'];
    visibleStock = json['visible_stock'];
    active = json['active'];
    deleted = json['deleted'];
    delstamp = json['delstamp'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    price = json['price']?.toDouble();
    cost = json['cost']?.toDouble();
    discount = json['discount']?.toDouble();
    quantity = _parseInt(json['quantity']);
    tags = json['tags'];
    nameAr = json['name_ar'];
    briefAr = json['brief_ar'];
    descAr = json['desc_ar'];
    measureAr = json['measure_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_group_id'] = productGroupId;
    data['return_policy_id'] = returnPolicyId;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['wholesale_parent_id'] = wholesaleParentId;
    data['wholesale_parent_quantity'] = wholesaleParentQuantity;
    data['slug'] = slug;
    data['sku'] = sku;
    data['barcode'] = barcode;
    data['model'] = model;
    data['name'] = name;
    data['brief'] = brief;
    data['desc'] = desc;
    data['measure'] = measure;
    data['icon'] = icon;
    data['thumbnail'] = thumbnail;
    data['image'] = image;
    data['per_order'] = perOrder;
    data['infinite_stock'] = infiniteStock;
    data['visible_stock'] = visibleStock;
    data['active'] = active;
    data['deleted'] = deleted;
    data['delstamp'] = delstamp;
    data['addstamp'] = addstamp;
    data['updatestamp'] = updatestamp;
    data['price'] = price;
    data['cost'] = cost;
    data['discount'] = discount;
    data['quantity'] = quantity;
    data['tags'] = tags;
    data['name_ar'] = nameAr;
    data['brief_ar'] = briefAr;
    data['desc_ar'] = descAr;
    data['measure_ar'] = measureAr;
    return data;
  }

  int? _parseInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }
}
