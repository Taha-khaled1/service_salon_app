class SlidersModel {
  List<SlidersData>? data;
  String? message;
  int? status;

  SlidersModel({this.data, this.message, this.status});

  SlidersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SlidersData>[];
      json['data'].forEach((v) {
        data!.add(new SlidersData.fromJson(v));
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

class SlidersData {
  int? id;
  String? image;

  SlidersData({this.id, this.image});

  SlidersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
