import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/custombutten.dart';
import 'package:single_salon/presentation_layer/screen/cart_screen/cart_controller/cart_controller.dart';
import 'package:single_salon/presentation_layer/screen/cart_screen/widget/cart_card.dart';
import 'package:single_salon/presentation_layer/screen/cart_screen/widget/final_price.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/components/navbar.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data_layer/models/carttest.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarScreenWithBack('عربة التسوق'),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            width: deviceInfo.localWidth,
            height: deviceInfo.localHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgraound.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartCard(
                        cart: cartItem[index],
                        index: index,
                      );
                    },
                  ),
                ),
                BottomSection(
                  width: deviceInfo.localWidth * 0.85,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
    required this.width,
  });
  final double width;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Divider(
                thickness: 2,
              ),
              GetBuilder<CartController>(
                builder: (controller) {
                  return Column(
                    children: [
                      FinalPrice(
                        title: 'المجموع الفرعي',
                        price: controller.totelPrice.toString(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FinalPrice(
                        title: 'ضريبة',
                        price: controller.totelTex.toString(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: deviceInfo.localWidth * 0.1),
                        child: CustomButton(
                          width: deviceInfo.localWidth * 0.8,
                          haigh: 60,
                          color: ColorManager.kPrimary,
                          text: 'طلب المنتجات',
                          press: () {},
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CachCard extends StatelessWidget {
  const CachCard({
    super.key,
    required this.width,
    required this.text,
    required this.controller,
    required this.valuebut,
  });
  final double width;
  final String text, valuebut;
  final CartController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: width,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: ColorManager.grey2,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.kPrimary),
      ),
      child: Row(
        children: [
          Radio(
            value: valuebut,
            groupValue: controller.deliveryType,
            onChanged: (value) {
              controller.updatePay(value!);
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.ktextblackk,
              fontSize: FontSize.s18,
            ),
          ),
        ],
      ),
    );
  }
}
