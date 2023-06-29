import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:single_salon/presentation_layer/screen/account_screen/account_screen.dart';
import 'package:single_salon/presentation_layer/screen/cart_screen/cart_screen.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/home_screen.dart';

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

PreferredSizeWidget appbarScreenWithdrawer(String title) {
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
            Get.to(() => CartScreen());
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

class customAppBar extends StatelessWidget {
  const customAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 18),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'assets/icons/icons8-menu.svg',
              height: 35,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: MangeStyles().getBoldStyle(
                color: ColorManager.kTextblack,
                fontSize: FontSize.s18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
