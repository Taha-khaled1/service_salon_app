class followBookingModel {
  List<Data>? data;
  String? message;
  int? status;

  followBookingModel({this.data, this.message, this.status});

  followBookingModel.fromJson(Map<String, dynamic> json) {
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
  String? theDateOfBooking;
  String? title;
  List<Sessions>? sessions;

  Data({this.theDateOfBooking, this.title, this.sessions});

  Data.fromJson(Map<String, dynamic> json) {
    theDateOfBooking = json['The date of Booking'];
    title = json['title'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(new Sessions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['The date of Booking'] = this.theDateOfBooking;
    data['title'] = this.title;
    if (this.sessions != null) {
      data['sessions'] = this.sessions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sessions {
  String? sessionDate;
  Null? details;

  Sessions({this.sessionDate, this.details});

  Sessions.fromJson(Map<String, dynamic> json) {
    sessionDate = json['session_date'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_date'] = this.sessionDate;
    data['details'] = this.details;
    return data;
  }
}
