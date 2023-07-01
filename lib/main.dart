import 'package:single_salon/application_layer/constant/myapp.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("lang", 'en');
  final id = sharedPreferences.getInt('id');
  final name = sharedPreferences.getString('name');
  final email = sharedPreferences.getString('email');
  final phone = sharedPreferences.getString('phone');
  final token = sharedPreferences.getString('token');

  print('id: $id');
  print('name: $name');
  print('email: $email');
  print('phone: $phone');
  print('token: $token');
  runApp(
    DevicePreview(
      builder: (context) {
        return MyApp();
      },
    ),
  );
}
