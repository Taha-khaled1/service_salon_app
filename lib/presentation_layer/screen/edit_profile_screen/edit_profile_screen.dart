import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/application_layer/utils/valid.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/components/custombutten.dart';
import 'package:single_salon/presentation_layer/components/customtextfild.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:single_salon/presentation_layer/resources/values_manager.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  StatusRequest statusRequest1 = StatusRequest.none;
  String? name, phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarScreenWithBack('تعديل الحساب'),
      backgroundColor: ColorManager.background,
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            alignment: Alignment.center,
            width: deviceInfo.localWidth,
            height: deviceInfo.localHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgraound.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
              ),
              child: Form(
                key: formkeysigin,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        thickness: 1.2,
                      ),
                      Text(
                        'الاسم واللقب',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kTextlightgray,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextfeild(
                        // inialvalue: sharedPreferences.getString('name'),
                        valid: (p0) {
                          return validInput(p0.toString(), 1, 100, 'type');
                        },
                        onsaved: (p0) {
                          return name = p0.toString();
                        },
                        titel: 'ادخل هنا',
                        width: deviceInfo.localWidth * 0.02,
                        height: 70,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'رقم الهاتف',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kTextlightgray,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextfeild(
                        // inialvalue: sharedPreferences.getString('phone') == 'null'
                        //     ? 'لايوجد رقم هاتف'
                        //     : sharedPreferences.getString('phone')!,
                        valid: (p0) {
                          return validInput(p0.toString(), 1, 100, 'type');
                        },
                        onsaved: (p0) {
                          return phone = p0.toString();
                        },
                        titel: 'ادخل هنا',
                        width: deviceInfo.localWidth * 0.02,
                        height: 70,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'البريد الاكتروني',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kTextlightgray,
                          fontSize: FontSize.s20,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextfeild(
                        // inialvalue: sharedPreferences.getString('phone') == 'null'
                        //     ? 'لايوجد رقم هاتف'
                        //     : sharedPreferences.getString('phone')!,
                        valid: (p0) {
                          return validInput(p0.toString(), 1, 100, 'email');
                        },
                        onsaved: (p0) {
                          // return  = p0.toString();
                        },
                        titel: 'ادخل هنا',
                        width: deviceInfo.localWidth * 0.02,
                        height: 70,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        width: deviceInfo.localWidth * 0.95,
                        haigh: 60,
                        color: ColorManager.kPrimary,
                        text: 'حفظ التغيرات',
                        press: () {},
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
