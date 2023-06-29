import 'package:single_salon/main.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/components/custombutten.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/strings_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:single_salon/presentation_layer/screen/account_screen/widget/customListtile.dart';
import 'package:single_salon/presentation_layer/screen/calendar_screen/calendar_screen.dart';
import 'package:single_salon/presentation_layer/screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:single_salon/presentation_layer/screen/screenseting/privacy_screen.dart';
import 'package:single_salon/presentation_layer/screen/screenseting/sharescreen.dart';
import 'package:single_salon/presentation_layer/screen/support_screen/support_problem_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: appbarScreenWithBack('لوحة التحكم'),
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
            child: ListView(
              children: [
                SizedBox(height: 50),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(
                    AppStrings.account.tr,
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
                CustomListtile(
                  widget: Icon(
                    Icons.person,
                    color: ColorManager.kTextblack,
                  ),
                  titel: AppStrings.account_information.tr,
                  onTap: () {
                    Get.to(() => EditProfileScreen());
                  },
                ),
                CustomListtile(
                  widget: Icon(
                    Icons.privacy_tip_outlined,
                    color: ColorManager.kTextblack,
                  ),
                  titel: AppStrings.trackBookings.tr,
                  onTap: () {
                    // Get.to(page);
                  },
                ),
                CustomListtile(
                  widget: Icon(
                    Icons.policy_outlined,
                    color: ColorManager.kTextblack,
                  ),
                  titel: AppStrings.trackRequests.tr,
                  onTap: () {
                    // Get.to(TermsAndConditionsPage());
                  },
                ),
                CustomListtile(
                  widget: Icon(
                    Icons.share,
                    color: ColorManager.kTextblack,
                  ),
                  titel: AppStrings.share_app.tr,
                  onTap: () {
                    Get.to(() => ShareApp());
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Text(
                    AppStrings.help.tr,
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
                CustomListtile(
                  widget: Icon(
                    Icons.calendar_month_outlined,
                    color: ColorManager.kTextblack,
                  ),
                  titel: AppStrings.calendar.tr,
                  onTap: () {
                    Get.to(
                      () => CalendarScreen(),
                    );
                  },
                ),
                CustomListtile(
                  widget: Icon(
                    Icons.privacy_tip_outlined,
                    color: ColorManager.kTextblack,
                  ),
                  titel: AppStrings.privacy_policy.tr,
                  onTap: () {
                    Get.to(() => PrivacyScreen());
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomSwitch(),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: deviceInfo.localWidth * 0.1),
                  child: CustomButton(
                    width: deviceInfo.localWidth * 0.8,
                    haigh: 60,
                    color: ColorManager.kPrimary,
                    text: AppStrings.sign_out.tr,
                    press: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = sharedPreferences.getString('lang') == 'ar' ? false : true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: _value,
      onChanged: (value) {
        if (sharedPreferences.getString('lang') == 'ar') {
          print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
          sharedPreferences.setString("lang", 'en');
          Get.updateLocale(Locale('en'));

          print(sharedPreferences.getString('lang'));
        } else {
          print('########################################');
          sharedPreferences.setString("lang", 'ar');
          Get.updateLocale(Locale('ar'));
        }
        setState(() {
          _value = !_value;
        });
      },
      title: Text(
        AppStrings.chang_lang.tr,
        style: MangeStyles().getBoldStyle(
          color: ColorManager.kTextblack,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}
