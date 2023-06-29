import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/handlingView/handlingview.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:single_salon/presentation_layer/screen/service_screen/service_controller/service_controller.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);
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
                    child: GetBuilder<ServiceController>(
                      init: ServiceController(),
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
                              childAspectRatio:
                                  200 / 305, // Adjust this ratio as needed
                            ),
                            itemBuilder: (context, index) {
                              return ProductWidget(
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
