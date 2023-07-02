class OrderFollowModel {
  List<Data>? data;
  String? message;
  int? status;

  OrderFollowModel({this.data, this.message, this.status});

  OrderFollowModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? theDateOfOrder;
  String? total;
  String? status;
  List<Products>? products;

  Data({this.theDateOfOrder, this.total, this.status, this.products});

  Data.fromJson(Map<String, dynamic> json) {
    theDateOfOrder = json['The date of Order'];
    total = json['total'];
    status = json['status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['The date of Order'] = this.theDateOfOrder;
    data['total'] = this.total;
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  String? image;
  String? discountPrice;
  String? price;

  Products(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.discountPrice,
      this.price});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    discountPrice = json['discount_price'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['discount_price'] = this.discountPrice;
    data['price'] = this.price;
    return data;
  }
}
