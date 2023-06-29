import 'package:get/get.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/models/cateogery_model.dart';
import 'package:single_salon/data_layer/models/productmodel.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';

class HomeController extends GetxController {
  late StatusRequest statusRequest1;
  late StatusRequest statusRequest2;
  CatogeryModels? catogeryModels;
  ServiceModel? serviceModel;
  int selectedCategoryIndex = 0;

  void changeSelected(int value) {
    selectedCategoryIndex = value;
    getAllproduct(catogeryModels?.data![selectedCategoryIndex].id ?? 1);
    update();
  }

  getAllcatogery() async {
    try {
      statusRequest2 = StatusRequest.loading;
      statusRequest1 = StatusRequest.loading;
      var response = await getAllcatogeryRespon();
      statusRequest1 = handlingData(response);
      if (statusRequest1 == StatusRequest.success) {
        catogeryModels = await CatogeryModels.fromJson(response);
        getAllproduct(catogeryModels?.data![selectedCategoryIndex].id ?? 2);
      } else {
        statusRequest1 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest1 = StatusRequest.erorr;
    }
    update();
  }

  getAllproduct(int id) async {
    try {
      statusRequest2 = StatusRequest.loading;
      var response = await getServiceByIdRespon(id);
      statusRequest2 = handlingData(response);
      if (statusRequest2 == StatusRequest.success) {
        serviceModel = await ServiceModel.fromJson(response);
      } else {
        statusRequest2 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest2 = StatusRequest.erorr;
    }
    update();
  }

  @override
  void onInit() {
    getAllcatogery();
    super.onInit();
  }
}
