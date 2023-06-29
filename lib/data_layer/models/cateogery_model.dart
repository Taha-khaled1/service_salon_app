class CatogeryModels {
  List<CatogeryData>? data;
  String? message;
  int? status;

  CatogeryModels({this.data, this.message, this.status});

  CatogeryModels.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CatogeryData>[];
      json['data'].forEach((v) {
        data!.add(new CatogeryData.fromJson(v));
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

class CatogeryData {
  int? id;
  String? title;
  String? image;

  CatogeryData({this.id, this.title, this.image});

  CatogeryData.fromJson(Map<String, dynamic> json) {
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
