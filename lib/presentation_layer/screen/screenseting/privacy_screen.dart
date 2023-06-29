import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Html(data: '''
          
          
          <!DOCTYPE html>
          <html lang="ar">
          <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>شروط وأحكام التطبيق</title>
            <style>
              body {
                font-family: Arial, sans-serif;
                margin: 20px;
                line-height: 1.5;
              }
          
              h1 {
                color: #fff;
                font-size: 24px;
              }
          
              h2 {
                color: #fff;
                font-size: 18px;
              }
          
              p {
                color: #777;
                font-size: 16px;
              }
          
              ul {
                color: #777;
                font-size: 16px;
                list-style-type: disc;
                padding-left: 20px;
              }
            </style>
          </head>
          <body>
            <h1>شروط وأحكام التطبيق</h1>
            <p>هذا التطبيق هو تطبيق شات يهدف إلى تيسير التعارف بين الناس مشابه لتطبيق الواتساب.</p>
            
            <h2>الشروط والأحكام</h2>
            <ul>
              <li>يجب استخدام التطبيق وفقًا للقوانين المحلية والدولية المعمول بها.</li>
              <li>يمنع استخدام التطبيق لأغراض غير قانونية أو ضارة.</li>
              <li>يجب احترام خصوصية المستخدمين الآخرين وعدم نشر أو مشاركة معلوماتهم الشخصية بدون إذن.</li>
              <li>يحق للإدارة أن تتخذ التدابير اللازمة في حالة مخالفة أحد المستخدمين للشروط والأحكام.</li>
              <li>التطبيق غير مسؤول عن أي ضرر ينتج عن استخدامه غير الصحيح أو غير القانوني.</li>
            </ul>
            
            <h2>تواصل معنا</h2>
            <p>إذا كان لديك أي استفسارات أو ملاحظات حول شروط وأحكام التطبيق، يرجى التواصل معنا عبر الوسائل المتاحة.</p>
          </body>
          </html>
          
          
          '''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
