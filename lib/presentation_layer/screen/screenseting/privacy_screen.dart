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
  <title>سياسة الخصوصية</title>
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
  <h1>سياسة الخصوصية</h1>
  <p>نحن نقدر ثقتك فينا، ونحن ندرك أنه يجب علينا الحفاظ على خصوصيتك. في هذه السياسة، نشرح كيفية استخدامنا للمعلومات التي نجمعها من خلال تطبيقنا وخدماتنا.</p>

  <h2>المعلومات التي نجمعها</h2>
  <p>عند استخدام تطبيقنا، قد نجمع المعلومات التالية:</p>
  <ul>
    <li>الاسم الكامل</li>
    <li>العنوان البريدي</li>
    <li>رقم الهاتف</li>
    <li>البريد الإلكتروني</li>
    <li>معلومات الدفع</li>
    <li>معلومات الطلبات والمشتريات</li>
  </ul>

  <h2>كيفية استخدامنا للمعلومات</h2>
  <p>نستخدم المعلومات التي نجمعها لتحسين تجربتك على تطبيقنا، وكذلك لتقديم الخدمات التي طلبتها. نحن لا نبيع أو نشارك معلوماتك مع أي طرف ثالث دون موافقتك الصريحة، إلا إذا كان ذلك مطلوبًا قانونًا أو لتنفيذ أحد الشروط والأحكام الخاصة بنا.</p>

  <h2>كيفية حماية المعلومات</h2>
  <p>نحن نتخذ إجراءات أمنية ملائمة لحماية المعلومات الشخصية التي نجمعها، بما في ذلك إجراءات الوصول المناسبة والتحكم في الوصول وتقنيات التشفير. ومع ذلك، يجب ملاحظة أنه لا يوجد أمن مطلق على الإنترنت، ونحن لا نضمن أنه لن يتم الوصول إلى المعلومات بطرق غير مصرح بها.</p>

  <h2>كيفية التواصل معنا</h2>
  <p>إذا كان لديك أي أسئلة أو استفسارات حول سياسة الخصوصية الخاصة بنا، يرجى التواصل معنا عبر الوسائل المتاحة على تطبيقنا.</p>
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
