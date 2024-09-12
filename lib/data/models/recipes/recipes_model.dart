class RecipesModel {
  int? id;
  String? slug;
  String? name;
  String? brief;
  String? ingredients;
  String? preparations;
  String? icon;
  String? thumbnail;
  String? image;
  String? active;
  String? deleted;
  String? delstamp;
  String? addstamp;
  String? updatestamp;
  String? nameAr;
  String? briefAr;
  String? ingredientsAr;
  String? preparationsAr;

  RecipesModel(RecipesModel recipesToCache,
      {this.id,
      this.slug,
      this.name,
      this.brief,
      this.ingredients,
      this.preparations,
      this.icon,
      this.thumbnail,
      this.image,
      this.active,
      this.deleted,
      this.delstamp,
      this.addstamp,
      this.updatestamp,
      this.nameAr,
      this.briefAr,
      this.ingredientsAr,
      this.preparationsAr});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    brief = json['brief'];
    ingredients = json['ingredients'];
    preparations = json['preparations'];
    icon = json['icon'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    active = json['active'];
    deleted = json['deleted'];
    delstamp = json['delstamp'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    nameAr = json['name_ar'];
    briefAr = json['brief_ar'];
    ingredientsAr = json['ingredients_ar'];
    preparationsAr = json['preparations_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['brief'] = this.brief;
    data['ingredients'] = this.ingredients;
    data['preparations'] = this.preparations;
    data['icon'] = this.icon;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    data['active'] = this.active;
    data['deleted'] = this.deleted;
    data['delstamp'] = this.delstamp;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['name_ar'] = this.nameAr;
    data['brief_ar'] = this.briefAr;
    data['ingredients_ar'] = this.ingredientsAr;
    data['preparations_ar'] = this.preparationsAr;
    return data;
  }
}
