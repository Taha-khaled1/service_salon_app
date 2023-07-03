import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:single_salon/main.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/components/show_dialog.dart';
import 'package:single_salon/presentation_layer/handlingView/handlingview.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:single_salon/presentation_layer/screen/login_screen/login_screen.dart';
import 'package:single_salon/presentation_layer/screen/product_screen/product_controller/product_controller.dart';
import 'package:single_salon/presentation_layer/screen/service_by_catogery_screen/service_by_catogery_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 30),
                    child: GetBuilder<ProductController>(
                      init: ProductController(),
                      builder: (controller) {
                        return HandlingDataView(
                          statusRequest: controller.statusRequest1,
                          widget: GridView.builder(
                            itemCount: controller.serviceModel?.data!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisSpacing: 25,
                              crossAxisSpacing: 10,
                              childAspectRatio: getChildAspectRatio(
                                deviceInfo,
                              ), // Adjust this ratio as needed
                            ),
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                isservice: false,
                                press: () {
                                  checkLogin(
                                    context: context,
                                    onConfirmBtnTap: () {
                                      Get.to(() => LoginScreen());
                                    },
                                    elsefun: () {
                                      controller.addtoCart(
                                        context,
                                        controller.serviceModel?.data![index]
                                                .id ??
                                            1,
                                      );
                                    },
                                  );
                                },
                                serviceData:
                                    controller.serviceModel?.data![index],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
