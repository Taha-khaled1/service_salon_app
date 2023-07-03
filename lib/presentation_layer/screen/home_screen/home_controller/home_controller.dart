import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/models/cateogery_model.dart';
import 'package:single_salon/data_layer/models/productmodel.dart';
import 'package:single_salon/data_layer/models/sliderModel.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';
import 'package:single_salon/presentation_layer/components/show_dialog.dart';
import 'package:single_salon/presentation_layer/resources/strings_manager.dart';
import 'package:single_salon/presentation_layer/screen/login_screen/login_screen.dart';

class HomeController extends GetxController {
  late StatusRequest statusRequest1;
  late StatusRequest statusRequest;
  late StatusRequest statusRequest3;
  late StatusRequest statusRequest2;
  CatogeryModels? catogeryModels;
  ServiceModel? serviceModel;
  SlidersModel? slidersModel;
  int selectedCategoryIndex = 0;
  List<Container> ximageoffer = [];

  void changeSelected(int value) {
    selectedCategoryIndex = value;
    getServiceById(catogeryModels?.data![selectedCategoryIndex].id ?? 1);
    update();
  }

  bookingService(
      BuildContext context, int service_id, String booking_date) async {
    statusRequest = StatusRequest.loading;
    update();

    var respon = await bookingServiceRespon(service_id, booking_date);
    statusRequest = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest) {
        if (respon['message'].toString() == 'success') {
          showDilog(context, AppStrings.service_booked_successfully.tr);
        } else if (respon['message'].toString() == 'Unauthenticated') {
          showDilog(
            context,
            AppStrings.login_required_service_not_booked.tr,
            type: QuickAlertType.warning,
            onConfirmBtnTap: () {
              Get.to(() => LoginScreen());
            },
          );
        } else {
          showDilog(
            context,
            AppStrings.login_required.tr,
            type: QuickAlertType.info,
          );
        }
      } else {
        showDilog(
          context,
          AppStrings.there_is_a_problem_please_try_again.tr,
          type: QuickAlertType.error,
        );
      }
    } catch (e) {
      print('catch $e');
      showDilog(
        context,
        AppStrings.there_is_a_problem_please_try_again.tr,
        type: QuickAlertType.error,
      );
    }

    update();
  }

  getSliderscatogery() async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await getSliderRespon();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        slidersModel = await SlidersModel.fromJson(response);
        for (var element in slidersModel!.data!) {
          ximageoffer.add(
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  element.image!,
                  fit: BoxFit.cover,
                  width: 600,
                  height: 200,
                ),
              ),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest = StatusRequest.erorr;
    }
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
        getServiceById(catogeryModels?.data![selectedCategoryIndex].id ?? 2);
      } else {
        statusRequest1 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest1 = StatusRequest.erorr;
    }
    update();
  }

  getServiceById(int id) async {
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
    getSliderscatogery();
    getAllcatogery();
    super.onInit();
  }
}
