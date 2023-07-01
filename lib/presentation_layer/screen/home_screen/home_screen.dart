import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_salon/data_layer/models/productmodel.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/components/custombutten.dart';
import 'package:single_salon/presentation_layer/handlingView/handlingview.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/strings_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/home_controller/home_controller.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/widget/Titelmore.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/widget/catogery_card.dart';
import 'package:single_salon/presentation_layer/screen/service_details_screen/service_details_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
void openDrawer() {
  scaffoldKey.currentState?.openDrawer();
}

List<Widget> ximageoffer = [
  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset('assets/images/offer.png'),
    ),
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController(), permanent: true);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
                  //   child: Text(
                  //     Ap,
                  //     style: MangeStyles().getBoldStyle(
                  //       color: ColorManager.kPrimary2,
                  //       fontSize: FontSize.s18,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CarouselSlider(
                      items: ximageoffer,
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GetBuilder<HomeController>(
                    builder: (controller) {
                      return HandlingDataView(
                        statusRequest: controller.statusRequest1,
                        widget: Column(
                          children: [
                            Titelmore(
                              text1: AppStrings.categories.tr,
                              text2: AppStrings.more.tr,
                              onTap: () {},
                            ),
                            SizedBox(
                              height: 140,
                              child: ListView.builder(
                                itemCount:
                                    controller.catogeryModels?.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CatogeryCard(
                                    catogeryData:
                                        controller.catogeryModels?.data![index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
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
                                          horizontal: 10),
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
                  SizedBox(
                    height: 20,
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
                                press: () {},
                                isservice: true,
                                serviceData:
                                    homeController.serviceModel?.data![index],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
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

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    this.serviceData,
    this.isservice,
    this.press,
  });
  final ServiceData? serviceData;
  final bool? isservice;
  final void Function()? press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailsScreen(
              des: serviceData?.description ?? "",
              titel: serviceData?.title ?? "",
              price: serviceData?.price ?? "",
              id: serviceData?.id ?? 1,
              image: serviceData?.image ?? "",
              discountPrice: serviceData?.discountPrice ?? "",
              isservice: isservice ?? true,
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 305,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.kPrimary2),
        ),
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return Column(
              children: [
                Image.network(
                  serviceData?.image! ?? '',
                  fit: BoxFit.fill,
                  width: 500,
                  height: 155,
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    '${serviceData?.title ?? ''}',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kPrimary2,
                      fontSize: FontSize.s16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // SizedBox(height: 8),
                // Text(
                //   'أعد شحن جسدك وعقلك من خلال التدليك المنعش للأنسجة العميقة لمدة 90 دقيقة. يستخدم المعالجون المهرة لدي',
                //   style: TextStyle(
                //     color: ColorManager.kPrimary2,
                //     fontSize: FontSize.s14,
                //     fontFamily: "Cairo",
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 5),
                Text(
                  '${AppStrings.aed.tr} ${serviceData?.price ?? '10'}',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kPrimary2,
                    fontSize: FontSize.s16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                CustomButton(
                  width: deviceInfo.localWidth * 0.8,
                  haigh: 50,
                  fontSize: 14,
                  color: Colors.black,
                  text: AppStrings.getService.tr,
                  press: press,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
