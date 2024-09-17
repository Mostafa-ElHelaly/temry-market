class SimilarProductsModel {
  int? id;
  // Null? productGroupId;
  // Null? returnPolicyId;
  int? categoryId;
  int? brandId;
  // Null? wholesaleParentId;
  int? wholesaleParentQuantity;
  String? slug;
  String? sku;
  String? barcode;
  String? model;
  String? name;
  String? brief;
  String? desc;
  String? measure;
  // Null? icon;
  // Null? thumbnail;
  // Null? image;
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

  SimilarProductsModel(
      {this.id,
      // this.productGroupId,
      // this.returnPolicyId,
      this.categoryId,
      this.brandId,
      // this.wholesaleParentId,
      this.wholesaleParentQuantity,
      this.slug,
      this.sku,
      this.barcode,
      this.model,
      this.name,
      this.brief,
      this.desc,
      this.measure,
      // this.icon,
      // this.thumbnail,
      // this.image,
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
      this.updatestamp});

  SimilarProductsModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // productGroupId = json['product_group_id'];
    // returnPolicyId = json['return_policy_id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    // wholesaleParentId = json['wholesale_parent_id'];
    wholesaleParentQuantity = json['wholesale_parent_quantity'];
    slug = json['slug'];
    sku = json['sku'];
    barcode = json['barcode'];
    model = json['model'];
    name = json['name'];
    brief = json['brief'];
    desc = json['desc'];
    measure = json['measure'];
    // icon = json['icon'];
    // thumbnail = json['thumbnail'];
    // image = json['image'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // data['product_group_id'] = this.productGroupId;
    // data['return_policy_id'] = this.returnPolicyId;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    // data['wholesale_parent_id'] = this.wholesaleParentId;
    data['wholesale_parent_quantity'] = this.wholesaleParentQuantity;
    data['slug'] = this.slug;
    data['sku'] = this.sku;
    data['barcode'] = this.barcode;
    data['model'] = this.model;
    data['name'] = this.name;
    data['brief'] = this.brief;
    data['desc'] = this.desc;
    data['measure'] = this.measure;
    // data['icon'] = this.icon;
    // data['thumbnail'] = this.thumbnail;
    // data['image'] = this.image;
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
    return data;
  }
}
