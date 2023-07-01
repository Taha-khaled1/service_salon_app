import 'dart:convert';

import 'package:single_salon/application_layer/utils/valid.dart';
import 'package:single_salon/main.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/custombutten.dart';
import 'package:single_salon/presentation_layer/components/customtextfild.dart';
import 'package:single_salon/presentation_layer/components/navbar.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    Future<void> login(String email, String password) async {
      // Make a post request with the email and password
      final response = await http.post(
        Uri.parse('https://77ls.ae/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // If the server responds with a status code of 200, parse the response
        // body and save the user data to SharedPreferences
        final data = jsonDecode(response.body)['data'];

        sharedPreferences.setInt('id', data['id']);
        sharedPreferences.setString('name', data['name']);
        sharedPreferences.setString('email', data['email']);
        sharedPreferences.setString('phone', data['phone']);
        sharedPreferences.setString('token', data['token']);
      } else {
        // If the server responds with an error status code, throw an exception
        throw Exception('Failed to login');
      }
    }

    return Scaffold(
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
            alignment: Alignment.center,
            child: Form(
              key: formkeysigin,
              child: InfoWidget(
                builder: (context, deviceInfo) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: deviceInfo.screenHeight * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            'مرحبًا،\nمرحبًا بعودتك مجددا',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s25,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: ColorManager.background,
                          backgroundImage: AssetImage('assets/icons/logom.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextfeild(
                          valid: (value) {
                            return validInput(
                              value.toString(),
                              3,
                              100,
                              'email',
                            );
                          },
                          onsaved: (p0) {
                            email = p0.toString();
                          },
                          titel: 'البريد الاكتروني',
                          width: 15,
                          height: 100,
                          icon: Icons.email,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextfeild(
                          valid: (value) {
                            return validInput(
                              value.toString(),
                              3,
                              100,
                              'pass',
                            );
                          },
                          onsaved: (p0) {
                            password = p0.toString();
                          },
                          titel: 'كلمة السر',
                          width: 15,
                          height: 100,
                          icon: Icons.lock,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        CustomButton(
                          width: deviceInfo.localWidth * 0.8,
                          haigh: 60,
                          color: ColorManager.kPrimary,
                          text: 'تسجيل الدخول',
                          press: () async {
                            if (formkeysigin.currentState!.validate()) {
                              formkeysigin.currentState!.save();
                              login(email!, password!).then((_) {
                                final id = sharedPreferences.getInt('id');
                                final name =
                                    sharedPreferences.getString('name');
                                final email =
                                    sharedPreferences.getString('email');
                                final phone =
                                    sharedPreferences.getString('phone');
                                final token =
                                    sharedPreferences.getString('token');

                                print('id: $id');
                                print('name: $name');
                                print('email: $email');
                                print('phone: $phone');
                                print('token: $token');
                                Get.to(() => Example());
                              }).catchError((error) {
                                print(error);
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextWithButtonTExt(
                          text1: 'ليس لديك حساب؟',
                          text2: 'اشتراك',
                          onTap: () {
                            // Get.to(() => SiginupScreen());
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class TextWithButtonTExt extends StatelessWidget {
  const TextWithButtonTExt({
    super.key,
    required this.text1,
    required this.text2,
    this.width,
    this.onTap,
  });
  final String text1, text2;
  final double? width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: MangeStyles().getBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s20,
          ),
        ),
        SizedBox(
          width: width ?? 10,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kPrimary2,
              fontSize: FontSize.s20,
            ),
          ),
        ),
      ],
    );
  }
}
