import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:single_salon/data_layer/models/cateogery_model.dart';
import 'package:single_salon/main.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/msnge_api.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:single_salon/presentation_layer/screen/service_by_catogery_screen/service_by_catogery_screen.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({Key? key, required this.catogeryData}) : super(key: key);
  final CatogeryData? catogeryData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        sharedPreferences.setInt('cId', catogeryData!.id!);
        Get.to(() => ServiceByCatogeryScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: ColorManager.kPrimary,
              radius: 40,
              backgroundImage: NetworkImage('${catogeryData!.image}'),
            ),
            SizedBox(
              height: 7,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(30),
            //   child: SizedBox(
            //     child: Image.asset(
            //       'assets/images/unsplash.png',
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
              child: Text(
                catogeryData!.title!.length <= 15
                    ? '${catogeryData!.title}'
                    : '${catogeryData!.title!.substring(0, 15)}..',
                textAlign: TextAlign.center,
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kPrimary2,
                  fontSize: FontSize.s14,
                ),
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
