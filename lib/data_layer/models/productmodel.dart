class ServiceModel {
  List<ServiceData>? data;
  String? message;
  int? status;

  ServiceModel({this.data, this.message, this.status});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ServiceData>[];
      json['data'].forEach((v) {
        data!.add(new ServiceData.fromJson(v));
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

class ServiceData {
  int? id;
  String? title;
  String? description;
  String? image;
  String? discountPrice;
  String? price;

  ServiceData(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.discountPrice,
      this.price});

  ServiceData.fromJson(Map<String, dynamic> json) {
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
