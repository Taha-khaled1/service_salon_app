import 'package:single_salon/data_layer/database/connectdatabase.dart';
import 'package:single_salon/main.dart';
import 'package:single_salon/presentation_layer/resources/msnge_api.dart';

getAllcatogeryRespon() async {
  print(sharedPreferences.getString('lang'));
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.categories,
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}

getServiceByIdRespon(int id) async {
  print(sharedPreferences.getString('lang'));
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.service}/$id',
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}

getAllServiceRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.allservice,
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}

getAllProductRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.products,
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}

getAllOffersRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.serviceOffers,
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}

contactUsRespon(name, email, message, phone) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.contact,
    {'name': name, 'email': email, 'phone': phone, 'message': message},
    encode: false,
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}

getProductDetalisRespon(int id) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    'https://77ls.ae/api/service/details/1',
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}

getAddtoCartRespon(int productid) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.addToCart,
    {'product_id': productid.toString()},
    myheadersres: Curd().myheadersfail,
  );
  print(respons);
  return respons;
}

getCartRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.getcartitem,
    myheadersres: Curd().myheaders2,
  );
  print(respons);
  return respons;
}

getSliderRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.sliders,
    myheadersres: Curd().myheaders3,
  );
  print(respons);
  return respons;
}

getCartCheckoutRespon(Map productids, Map mapQunt) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.checkout,
    {
      'product_ids': productids,
      'quantities': mapQunt,
    },
    encode: true,
    myheadersres: Curd().myheaders,
  );
  print(respons);
  return respons;
}

bookingServiceRespon(int service_id, booking_date) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.booking,
    {
      'service_id': service_id.toString(),
      'booking_date': booking_date,
    },
    myheadersres: Curd().myheadersfail,
  );
  print(respons);
  return respons;
}
