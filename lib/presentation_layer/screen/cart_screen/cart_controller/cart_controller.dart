import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quickalert/quickalert.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';

import '../../../../data_layer/models/carttest.dart';

class CartController extends GetxController {
  double totelPrice = 0;
  double totelTex = 0;
  int count = 0;
  bool xtemp = false;
  bool ctemp = false;
  String deliveryType = '';
  late StatusRequest statusRequest2;
  CartItemModel? cartItemModel;
  void updatePay(String value) {
    deliveryType = value;
    update();
  }

  getCartItemt() async {
    try {
      statusRequest2 = StatusRequest.loading;
      var response = await getCartRespon();
      statusRequest2 = handlingData(response);
      if (statusRequest2 == StatusRequest.success) {
        cartItemModel = await CartItemModel.fromJson(response);
      } else {
        statusRequest2 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest2 = StatusRequest.erorr;
    }
    update();
  }

  // StatusRequest statusRequest = StatusRequest.none;
  // deletecarts(BuildContext context, int id) async {
  //   statusRequest = StatusRequest.loading;
  //   update();

  //   var respon = await deleteFromCartRespon(id);
  //   statusRequest = handlingData(respon);
  //   try {
  //     if (StatusRequest.success == statusRequest) {
  //       if (respon['result'].toString() == 'true') {
  //         showDilog(context, 'تم حذف المنتج بنجاح');
  //         carModelsdemo.removeWhere(
  //           (element) => element.id == id,
  //         );
  //       } else {
  //         showDilog(
  //           context,
  //           'لم يتم حذف المنج ربما يوجد خطاء',
  //           type: QuickAlertType.info,
  //         );
  //       }
  //     } else {
  //       showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
  //     }
  //   } catch (e) {
  //     print('catch $e');
  //     showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
  //   }

  //   update();
  // }

  icrasingCount(int index, double price) {
    count++;
    cartItem[index].count++;
    totelPrice += price;
    update();
  }

  decrasingCount(int index, double price) {
    if (count > 1) {
      count--;
      cartItem[index].count--;
      totelPrice -= price;
      update();
    }
  }

  // StatusRequest statusRequest1 = StatusRequest.none;
  // saveOrder(BuildContext context, String id) async {
  //   statusRequest1 = StatusRequest.loading;
  //   update();

  //   var respon = await saveOrderRespon(id);
  //   statusRequest1 = handlingData(respon);
  //   try {
  //     if (StatusRequest.success == statusRequest1) {
  //       if (respon['result'].toString() == 'true') {
  //         carModelsdemo.clear();
  //         Get.offAndToNamed(Routes.sucssRoute);
  //       } else {
  //         showDilog(
  //           context,
  //           'عربة التسوق فارغه او الكميه غير متوفره',
  //           type: QuickAlertType.info,
  //         );
  //       }
  //     } else {
  //       showDilog(
  //         context,
  //         'يوجد مشكله بحساب المستخد يرجي التواصل مع الدعم',
  //         type: QuickAlertType.error,
  //       );
  //     }
  //   } catch (e) {
  //     print('catch $e');
  //     showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
  //   }

  //   update();
  // }

  @override
  void onInit() {
    getCartItemt();
    super.onInit();
  }
}
