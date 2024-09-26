class ProductDetailsModel {
  Product? product;
  List<Media>? media;
  List<Similar>? similar;

  ProductDetailsModel({this.product, this.media, this.similar});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    if (json['similar'] != null) {
      similar = <Similar>[];
      json['similar'].forEach((v) {
        similar!.add(new Similar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.similar != null) {
      data['similar'] = this.similar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? id;
  int? productGroupId;
  int? returnPolicyId;
  int? categoryId;
  int? brandId;
  // Null? wholesaleParentId;
  int? wholesaleParentQuantity;
  String? slug;
  String? sku;
  // Null? barcode;
  // Null? model;
  String? name;
  String? brief;
  // Null? desc;
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
  // Null? delstamp;
  String? addstamp;
  String? updatestamp;
  int? price;
  int? cost;
  int? discount;
  int? quantity;
  // Null? tags;
  String? nameAr;
  // Null? briefAr;
  // Null? descAr;
  // Null? measureAr;

  Product({
    this.id,
    this.productGroupId,
    this.returnPolicyId,
    this.categoryId,
    this.brandId,
    // this.wholesaleParentId,
    this.wholesaleParentQuantity,
    this.slug,
    this.sku,
    // this.barcode,
    // this.model,
    this.name,
    this.brief,
    // this.desc,
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
    // this.delstamp,
    this.addstamp,
    this.updatestamp,
    this.price,
    this.cost,
    this.discount,
    this.quantity,
    // this.tags,
    this.nameAr,
    // this.briefAr,
    // this.descAr,
    // this.measureAr
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productGroupId = json['product_group_id'];
    returnPolicyId = json['return_policy_id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    // wholesaleParentId = json['wholesale_parent_id'];
    wholesaleParentQuantity = json['wholesale_parent_quantity'];
    slug = json['slug'];
    sku = json['sku'];
    // barcode = json['barcode'];
    // model = json['model'];
    name = json['name'];
    brief = json['brief'];
    // desc = json['desc'];
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
    // delstamp = json['delstamp'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    price = json['price'];
    cost = json['cost'];
    discount = json['discount'];
    quantity = json['quantity'];
    // tags = json['tags'];
    nameAr = json['name_ar'];
    // briefAr = json['brief_ar'];
    // descAr = json['desc_ar'];
    // measureAr = json['measure_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_group_id'] = this.productGroupId;
    data['return_policy_id'] = this.returnPolicyId;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    // data['wholesale_parent_id'] = this.wholesaleParentId;
    data['wholesale_parent_quantity'] = this.wholesaleParentQuantity;
    data['slug'] = this.slug;
    data['sku'] = this.sku;
    // data['barcode'] = this.barcode;
    // data['model'] = this.model;
    data['name'] = this.name;
    data['brief'] = this.brief;
    // data['desc'] = this.desc;
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
    // data['delstamp'] = this.delstamp;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['price'] = this.price;
    data['cost'] = this.cost;
    data['discount'] = this.discount;
    data['quantity'] = this.quantity;
    // data['tags'] = this.tags;
    data['name_ar'] = this.nameAr;
    // data['brief_ar'] = this.briefAr;
    // data['desc_ar'] = this.descAr;
    // data['measure_ar'] = this.measureAr;
    return data;
  }
}

class Media {
  int? id;
  int? productId;
  String? image;
  String? addstamp;

  Media({this.id, this.productId, this.image, this.addstamp});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    addstamp = json['addstamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['addstamp'] = this.addstamp;
    return data;
  }
}

class Similar {
  int? id;
  int? productGroupId;
  int? returnPolicyId;
  int? categoryId;
  int? brandId;
  Null? wholesaleParentId;
  int? wholesaleParentQuantity;
  String? slug;
  String? sku;
  // Null? barcode;
  // Null? model;
  String? name;
  String? brief;
  String? desc;
  // Null? measure;
  String? icon;
  String? thumbnail;
  String? image;
  // Null? displayMultiplier;
  // Null? minOrderQuantity;
  // Null? stepOrderQuantity;
  // Null? maxOrderQuantity;
  // Null? minStock;
  // Null? packageWidth;
  // Null? packageHeight;
  // Null? packageLength;
  // Null? packageWeight;
  // Null? leadTimeFrom;
  // Null? leadTimeTo;
  String? perOrder;
  String? infiniteStock;
  String? visibleStock;
  String? active;
  String? deleted;
  String? delstamp;
  String? addstamp;
  String? updatestamp;

  Similar(
      {this.id,
      this.productGroupId,
      this.returnPolicyId,
      this.categoryId,
      this.brandId,
      this.wholesaleParentId,
      this.wholesaleParentQuantity,
      this.slug,
      this.sku,
      // this.barcode,
      // this.model,
      this.name,
      this.brief,
      this.desc,
      // this.measure,
      this.icon,
      this.thumbnail,
      this.image,
      // this.displayMultiplier,
      // this.minOrderQuantity,
      // this.stepOrderQuantity,
      // this.maxOrderQuantity,
      // this.minStock,
      // this.packageWidth,
      // this.packageHeight,
      // this.packageLength,
      // this.packageWeight,
      // this.leadTimeFrom,
      // this.leadTimeTo,
      this.perOrder,
      this.infiniteStock,
      this.visibleStock,
      this.active,
      this.deleted,
      this.delstamp,
      this.addstamp,
      this.updatestamp});

  Similar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productGroupId = json['product_group_id'];
    returnPolicyId = json['return_policy_id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    wholesaleParentId = json['wholesale_parent_id'];
    wholesaleParentQuantity = json['wholesale_parent_quantity'];
    slug = json['slug'];
    sku = json['sku'];
    // barcode = json['barcode'];
    // model = json['model'];
    name = json['name'];
    brief = json['brief'];
    desc = json['desc'];
    // measure = json['measure'];
    icon = json['icon'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    // displayMultiplier = json['display_multiplier'];
    // minOrderQuantity = json['min_order_quantity'];
    // stepOrderQuantity = json['step_order_quantity'];
    // maxOrderQuantity = json['max_order_quantity'];
    // minStock = json['min_stock'];
    // packageWidth = json['package_width'];
    // packageHeight = json['package_height'];
    // packageLength = json['package_length'];
    // packageWeight = json['package_weight'];
    // leadTimeFrom = json['lead_time_from'];
    // leadTimeTo = json['lead_time_to'];
    perOrder = json['per_order'];
    infiniteStock = json['infinite_stock'];
    visibleStock = json['visible_stock'];
    active = json['active'];
    deleted = json['deleted'];
    delstamp = json['delstamp'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
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
    // data['barcode'] = this.barcode;
    // data['model'] = this.model;
    data['name'] = this.name;
    data['brief'] = this.brief;
    data['desc'] = this.desc;
    // data['measure'] = this.measure;
    data['icon'] = this.icon;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    // data['display_multiplier'] = this.displayMultiplier;
    // data['min_order_quantity'] = this.minOrderQuantity;
    // data['step_order_quantity'] = this.stepOrderQuantity;
    // data['max_order_quantity'] = this.maxOrderQuantity;
    // data['min_stock'] = this.minStock;
    // data['package_width'] = this.packageWidth;
    // data['package_height'] = this.packageHeight;
    // data['package_length'] = this.packageLength;
    // data['package_weight'] = this.packageWeight;
    // data['lead_time_from'] = this.leadTimeFrom;
    // data['lead_time_to'] = this.leadTimeTo;
    data['per_order'] = this.perOrder;
    data['infinite_stock'] = this.infiniteStock;
    data['visible_stock'] = this.visibleStock;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['delstamp'] = this.delstamp;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    return data;
  }
}
