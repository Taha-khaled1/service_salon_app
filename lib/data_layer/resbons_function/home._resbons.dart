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
