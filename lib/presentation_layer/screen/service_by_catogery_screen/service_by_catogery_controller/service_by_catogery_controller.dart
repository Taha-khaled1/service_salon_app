import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/models/productmodel.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';
import 'package:single_salon/main.dart';
import 'package:single_salon/presentation_layer/components/show_dialog.dart';
import 'package:single_salon/presentation_layer/resources/strings_manager.dart';
import 'package:single_salon/presentation_layer/screen/login_screen/login_screen.dart';

class ServiceByCatogeryController extends GetxController {
  late StatusRequest statusRequest1;
  late StatusRequest statusRequest;
  ServiceModel? serviceModel;
  getServiceById(int id) async {
    try {
      statusRequest1 = StatusRequest.loading;
      var response = await getServiceByIdRespon(id);
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

  @override
  void onInit() {
    getServiceById(sharedPreferences.getInt('cId') ?? 1);
    super.onInit();
  }
}
