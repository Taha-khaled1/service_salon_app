import 'package:get/get.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/models/productmodel.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';

class ServiceController extends GetxController {
  late StatusRequest statusRequest1;
  ServiceModel? serviceModel;
  getAllService() async {
    try {
      statusRequest1 = StatusRequest.loading;
      var response = await getAllServiceRespon();
      statusRequest1 = handlingData(response);
      if (statusRequest1 == StatusRequest.success) {
        serviceModel = await ServiceModel.fromJson(response);
      } else {
        statusRequest1 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest1 = StatusRequest.erorr;
    }
    update();
  }

  @override
  void onInit() {
    getAllService();
    super.onInit();
  }
}
