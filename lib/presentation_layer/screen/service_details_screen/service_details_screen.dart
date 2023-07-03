import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:single_salon/main.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/custombutten.dart';
import 'package:single_salon/presentation_layer/handlingView/handlingview.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/strings_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/home_controller/home_controller.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:single_salon/presentation_layer/screen/service_details_screen/service_details_controller/service_detalis_controller.dart';
import 'package:single_salon/presentation_layer/screen/service_screen/service_controller/service_controller.dart';
import 'package:single_salon/presentation_layer/screen/support_screen/support_problem_account_screen.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({
    Key? key,
    required this.titel,
    required this.des,
    required this.id,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.isservice,
  }) : super(key: key);
  final String titel;
  final String des;
  final int id;
  final String image;
  final String price, discountPrice;
  final bool isservice;
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController(), permanent: true);
    // ServiceController serviceController =
    //     Get.put(ServiceController(), permanent: true);

    ServiceDetailsController servicedetailController =
        Get.put(ServiceDetailsController());
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
                crossAxisAlignment: sharedPreferences.getString('lang') == 'ar'
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 370,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight:
                              Radius.circular(20)), //assets/images/s.png
                      image: DecorationImage(
                        image: NetworkImage(
                          image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, top: 10),
                      child: CircleButton(
                        size: 50,
                        color1: Colors.grey[200],
                        onTap: () {
                          Get.back();
                        },
                        iconData: 'assets/icons/arrow.svg',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      titel,
                      style: MangeStyles().getBoldStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSize.s18,
                      ),
                    ),
                  ),
                  Text(
                    des,
                    style: TextStyle(
                      color: ColorManager.grey2,
                      fontSize: FontSize.s16,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceInfo.localWidth * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          width: 185,
                          haigh: 60,
                          color: ColorManager.kPrimary,
                          text: isservice
                              ? AppStrings.getService.tr
                              : AppStrings.add_cart.tr,
                          press: () async {
                            if (isservice) {
                              DateTime? dateTime = await showOmniDateTimePicker(
                                context: context,
                              );
                              print('$dateTime ${id}');
                              servicedetailController.bookingService(
                                context,
                                id,
                                dateTime.toString(),
                              );
                            } else {
                              servicedetailController.addtoCart(
                                context,
                                id,
                              );
                            }
                          },
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffAA5908)),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Text(
                            '${AppStrings.aed.tr} ${price}',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kPrimary2,
                              fontSize: FontSize.s16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  GetBuilder<HomeController>(
                    builder: (controller) {
                      return HandlingDataView(
                        statusRequest: homeController.statusRequest1,
                        widget: SizedBox(
                          height: 55,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                homeController.catogeryModels?.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  homeController.changeSelected(index);
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  alignment: Alignment.center,
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color:
                                        homeController.selectedCategoryIndex ==
                                                index
                                            ? ColorManager.kPrimary2
                                            : Colors.transparent,
                                    border:
                                        homeController.selectedCategoryIndex ==
                                                index
                                            ? Border.all(
                                                color: Colors.red, width: 1)
                                            : null,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: AnimatedOpacity(
                                    duration: Duration(milliseconds: 300),
                                    opacity:
                                        homeController.selectedCategoryIndex ==
                                                index
                                            ? 1.0
                                            : 0.8,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        homeController
                                                    .catogeryModels!
                                                    .data![index]
                                                    .title!
                                                    .length <=
                                                15
                                            ? '${homeController.catogeryModels?.data![index].title}'
                                            : '${homeController.catogeryModels?.data![index].title!.substring(0, 15)}..',
                                        style: MangeStyles().getBoldStyle(
                                          color: ColorManager.kTextblack,
                                          fontSize: FontSize.s16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  GetBuilder<HomeController>(
                    builder: (controller) {
                      return HandlingDataView(
                        statusRequest: homeController.statusRequest2,
                        widget: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: GridView.builder(
                            itemCount:
                                homeController.serviceModel?.data!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 25,
                              crossAxisSpacing: 10,
                              childAspectRatio: 200 / 305,
                            ),
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                serviceData:
                                    homeController.serviceModel?.data![index],
                                isservice: true,
                                press: () async {
                                  DateTime? dateTime =
                                      await showOmniDateTimePicker(
                                    context: context,
                                  );
                                  print(
                                      '$dateTime ${controller.serviceModel?.data![index].id ?? 1}');
                                  servicedetailController.bookingService(
                                    context,
                                    controller.serviceModel?.data![index].id ??
                                        1,
                                    dateTime.toString(),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
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
