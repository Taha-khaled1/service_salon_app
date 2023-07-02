class CartItem {
  final String name, image;
  final double price;
  int count;

  CartItem(
      {required this.name,
      required this.price,
      this.count = 1,
      required this.image});
}

List<CartItem> cartItem = [
  CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/catbag.png'),
  CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/catbag.png'),
  CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/catbag.png'),
  CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/catbag.png'),
  CartItem(name: 'القطه الكبيره', price: 20, image: 'assets/images/catbag.png'),
];

class CartItemModel {
  List<CartItemData>? data;
  String? message;
  int? status;

  CartItemModel({this.data, this.message, this.status});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CartItemData>[];
      json['data'].forEach((v) {
        data!.add(new CartItemData.fromJson(v));
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

class CartItemData {
  int? id;
  String? title;
  String? price;
  late int qunt;
  String? image;

  CartItemData({this.id, this.title, this.price, this.image, this.qunt = 1});

  CartItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
    qunt = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
