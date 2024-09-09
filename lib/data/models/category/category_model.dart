class CategoryModel {
  int? id;
  int? parentId;
  String? slug;
  String? name;
  String? desc;
  int? sortOrder;
  String? icon;
  String? thumbnail;
  String? parents;
  String? children;
  String? brands;
  String? active;
  String? deleted;
  String? delstamp;
  String? addstamp;
  String? updatestamp;
  String? nameAr;
  String? descAr;

  CategoryModel(jsonDecode,
      {this.id,
      this.parentId,
      this.slug,
      this.name,
      this.desc,
      this.sortOrder,
      this.icon,
      this.thumbnail,
      this.parents,
      this.children,
      this.brands,
      this.active,
      this.deleted,
      this.delstamp,
      this.addstamp,
      this.updatestamp,
      this.nameAr,
      this.descAr});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    slug = json['slug'];
    name = json['name'];
    desc = json['desc'];
    sortOrder = json['sort_order'];
    icon = json['icon'];
    thumbnail = json['thumbnail'];
    parents = json['parents'];
    children = json['children'];
    brands = json['brands'];
    active = json['active'];
    deleted = json['deleted'];
    delstamp = json['delstamp'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    nameAr = json['name_ar'];
    descAr = json['desc_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['sort_order'] = this.sortOrder;
    data['icon'] = this.icon;
    data['thumbnail'] = this.thumbnail;
    data['parents'] = this.parents;
    data['children'] = this.children;
    data['brands'] = this.brands;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['delstamp'] = this.delstamp;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['name_ar'] = this.nameAr;
    data['desc_ar'] = this.descAr;
    return data;
  }
}
