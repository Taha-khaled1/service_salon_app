import 'package:single_salon/application_layer/service/intitservices/localizetion/changelangue.dart';
import 'package:single_salon/application_layer/service/intitservices/localizetion/translate.dart';
import 'package:single_salon/presentation_layer/resources/routes_pages.dart';
import 'package:single_salon/presentation_layer/resources/theme_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      theme: getApplicationTheme(),
      getPages: getPage,
      // home: Example(),
    );
  }
}
