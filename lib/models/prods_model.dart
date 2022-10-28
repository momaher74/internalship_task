class ProductsModel {
  ProductsModel({
    required this.status,
    required this.message,
    required this.products,
  });

  late final int status;
  late final String message;
  late final List<Products> products;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['products'] = products.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.company,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.description,
  });

  late final int id;
  late final String company;
  late final String name;
  late final String type;
  late final String price;
  late final String image;
  late final String description;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company'] = company;
    _data['name'] = name;
    _data['type'] = type;
    _data['price'] = price;
    _data['image'] = image;
    _data['description'] = description;
    return _data;
  }
}
