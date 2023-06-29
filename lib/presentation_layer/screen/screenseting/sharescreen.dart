import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:share_plus/share_plus.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarScreenWithBack('مشاركة التطبيق'),
      backgroundColor: ColorManager.background,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Lottie.asset(
                    "assets/json/share.json",
                    height: 400,
                    width: deviceInfo.localWidth * 0.95,
                  ),
                  Text(
                    "مشاركة التطبيق",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  // const SizedBox(height: 33),
                  SizedBox(
                    height: 50,
                    width: Get.width * 0.4,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ColorManager.kPrimary),
                      ),
                      onPressed: () async {
                        try {
                          final box = context.findRenderObject() as RenderBox?;

                          await Share.share(
                            'https://77ls.ae/',
                            sharePositionOrigin:
                                box!.localToGlobal(Offset.zero) & box.size,
                          );
                          //  Share.share('check out my website https://example.com');
                        } catch (e) {
                          print('erorrrr  :  $e');
                        }
                      },
                      icon: const Icon(Icons.share),
                      label: Text(
                        'مشاركة التطبيق',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
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
