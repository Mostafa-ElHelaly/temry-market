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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['slug'] = slug;
    data['name'] = name;
    data['desc'] = desc;
    data['sort_order'] = sortOrder;
    data['icon'] = icon;
    data['thumbnail'] = thumbnail;
    data['parents'] = parents;
    data['children'] = children;
    data['brands'] = brands;
    data['active'] = active;
    data['deleted'] = deleted;
    data['delstamp'] = delstamp;
    data['addstamp'] = addstamp;
    data['updatestamp'] = updatestamp;
    data['name_ar'] = nameAr;
    data['desc_ar'] = descAr;
    return data;
  }
}
