import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quickalert/quickalert.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';
import 'package:single_salon/presentation_layer/components/show_dialog.dart';

import '../../../../data_layer/models/carttest.dart';

class CartController extends GetxController {
  double totelPrice = 0;
  double totelTex = 0;
  int count = 0;
  bool xtemp = false;
  bool ctemp = false;
  String deliveryType = '';
  late StatusRequest statusRequest2;
  StatusRequest statusRequest = StatusRequest.none;

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
        for (var element in cartItemModel!.data!) {
          totelPrice += double.parse(element.price!);
        }
      } else {
        statusRequest2 = StatusRequest.failure;
      }
    } catch (e) {
      statusRequest2 = StatusRequest.erorr;
    }
    update();
  }

  icrasingCount(int index, double price) {
    count++;
    cartItemModel!.data![index].qunt += 1;
    totelPrice += price;
    update();
  }

  decrasingCount(int index, double price) {
    if (count > 1) {
      count--;
      cartItemModel!.data![index].qunt -= 1;
      totelPrice -= price;
      update();
    }
  }

  checkOut(BuildContext context, Map productids, Map mapQunt) async {
    statusRequest = StatusRequest.loading;
    update();

    var respon = await getCartCheckoutRespon(productids, mapQunt);
    statusRequest = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest) {
        if (respon['message'].toString() == 'success') {
          showDilog(context, 'تم ارسال الرساله الخاصه بك\nبنجاح');
        } else {
          showDilog(
            context,
            'لم يتم ارسال الرساله',
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

  @override
  void onInit() {
    getCartItemt();
    super.onInit();
  }
}
