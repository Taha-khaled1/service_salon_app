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
  String? image;

  CartItemData({this.id, this.title, this.image});

  CartItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}
