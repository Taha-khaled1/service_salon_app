import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:single_salon/main.dart';
import 'package:single_salon/presentation_layer/components/show_dialog.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:single_salon/presentation_layer/screen/account_screen/account_screen.dart';
import 'package:single_salon/presentation_layer/screen/cart_screen/cart_screen.dart';
import 'package:single_salon/presentation_layer/screen/login_screen/login_screen.dart';

PreferredSizeWidget appbarscreen(String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorManager.background,
    leading: BackButton(
      color: ColorManager.kPrimary,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: MangeStyles().getBoldStyle(
        color: ColorManager.ktextblackk,
        fontSize: FontSize.s18,
      ),
    ),
    toolbarHeight: 70,
  );
}

PreferredSizeWidget appbarScreenWithdrawer(String title, BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/appbarimag.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    elevation: 0,
    // backgroundColor: ColorManager.background,
    leading: Row(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => AccountScreen());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(
              'assets/icons/user.png',
              height: 25,
              width: 25,
              color: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            checkLogin(
              context: context,
              onConfirmBtnTap: () {
                Get.to(() => LoginScreen());
              },
              elsefun: () {
                Get.to(() => CartScreen());
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(
              'assets/icons/shopping-cart.png',
              height: 25,
              width: 25,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
    centerTitle: true,
    title: Text(
      title,
      style: MangeStyles().getBoldStyle(
        color: ColorManager.kTextblack,
        fontSize: FontSize.s18,
      ),
    ),
    toolbarHeight: 40, leadingWidth: 80,
  );
}

PreferredSizeWidget appbarScreenWithBack(String title) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/appbarimag.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    elevation: 0,
    // backgroundColor: ColorManager.background,
    leading: BackButton(
      color: ColorManager.kPrimary,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: MangeStyles().getBoldStyle(
        color: ColorManager.kTextblack,
        fontSize: FontSize.s18,
      ),
    ),
    toolbarHeight: 40, leadingWidth: 40,
  );
}

void checkLogin(
    {required BuildContext context,
    required void Function()? onConfirmBtnTap,
    required void Function() elsefun}) {
  if (sharedPreferences.getString('token') == null) {
    showDilog(
      context,
      'يجب تسجيل الدخول اولا',
      type: QuickAlertType.info,
      onConfirmBtnTap: onConfirmBtnTap,
    );
  } else {
    elsefun();
  }
}
