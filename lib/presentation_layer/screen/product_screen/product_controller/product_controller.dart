import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/models/productmodel.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';
import 'package:single_salon/presentation_layer/components/show_dialog.dart';
import 'package:single_salon/presentation_layer/screen/login_screen/login_screen.dart';

class ProductController extends GetxController {
  late StatusRequest statusRequest1;
  late StatusRequest statusRequest2;
  ServiceModel? serviceModel;
  StatusRequest statusRequest = StatusRequest.none;

  addtoCart(BuildContext context, int productid) async {
    statusRequest = StatusRequest.loading;
    update();

    var respon = await getAddtoCartRespon(productid);
    statusRequest = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest) {
        if (respon['message'].toString() == 'success') {
          showDilog(context, 'تم الاضافه لعربة التسوق بنجاح');
        } else if (respon['message'].toString() == 'Unauthenticated') {
          showDilog(
            context,
            'يجب تسجيل الدخول',
            type: QuickAlertType.warning,
            onConfirmBtnTap: () {
              Get.to(() => LoginScreen());
            },
          );
        } else {
          showDilog(
            context,
            'لم يتم الاضافه لعربة التسوق',
            type: QuickAlertType.info,
          );
        }
      } else {
        showDilog(
          context,
          'يوجد مشكله ما',
          type: QuickAlertType.error,
        );
      }
    } catch (e) {
      print('catch $e');
      showDilog(
        context,
        'يوجد مشكله ما',
        type: QuickAlertType.error,
      );
    }

    update();
  }

  getAllProducts() async {
    try {
      statusRequest1 = StatusRequest.loading;
      var response = await getAllProductRespon();
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
    getAllProducts();
    super.onInit();
  }
}
