import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_salon/presentation_layer/Infowidget/models/device_info.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/handlingView/handlingview.dart';
import 'package:single_salon/presentation_layer/resources/strings_manager.dart';
import 'package:single_salon/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:single_salon/presentation_layer/screen/service_by_catogery_screen/service_by_catogery_controller/service_by_catogery_controller.dart';
import 'package:single_salon/presentation_layer/screen/service_screen/service_controller/service_controller.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class ServiceByCatogeryScreen extends StatelessWidget {
  const ServiceByCatogeryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarScreenWithBack(AppStrings.service.tr),
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
                    child: GetBuilder<ServiceByCatogeryController>(
                      init: ServiceByCatogeryController(),
                      builder: (controller) {
                        return HandlingDataView(
                          statusRequest: controller.statusRequest1,
                          widget: GridView.builder(
                            itemCount: controller.serviceModel?.data!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 25,
                              crossAxisSpacing: 10,
                              childAspectRatio: getChildAspectRatio(deviceInfo),
                            ),
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                serviceData:
                                    controller.serviceModel?.data![index],
                                isservice: true,
                                press: () async {
                                  DateTime? dateTime =
                                      await showOmniDateTimePicker(
                                    context: context,
                                  );
                                  print(
                                      '$dateTime ${controller.serviceModel?.data![index].id ?? 1}');
                                  controller.bookingService(
                                    context,
                                    controller.serviceModel?.data![index].id ??
                                        1,
                                    dateTime.toString(),
                                  );
                                },
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

double getChildAspectRatio(DeviceInfo deviceInfo) {
  print('${deviceInfo.localWidth} --${deviceInfo.localHeight} ');
  if (deviceInfo.localHeight < 450) {
    return 0.4;
  } else if (deviceInfo.localHeight < 680) {
    return 0.58;
  } else if (deviceInfo.localHeight < 740) {
    return 0.56;
  } else if (deviceInfo.localHeight < 845) {
    return 0.6;
  } else if (deviceInfo.localHeight < 900) {
    return 0.62;
  } else if (deviceInfo.localHeight < 1000) {
    return 0.66;
  } else if (deviceInfo.localHeight < 1300) {
    return 1.2;
  } else {
    return 1.7;
  }
}
