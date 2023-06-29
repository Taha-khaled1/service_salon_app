// ignore_for_file: file_names

import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({
    Key? key,
    this.image,
    required this.onTap,
    required this.titel,
    this.textStyle,
    this.widget,
  }) : super(key: key);
  final void Function()? onTap;
  final String? image, titel;
  final TextStyle? textStyle;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ColorManager.kTextblack,
      ),
      leading: widget ??
          SvgPicture.asset(
            image!,
            color: ColorManager.kTextblack,
          ),
      title: Text(
        titel!,
        style: textStyle ??
            MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s18,
            ),
      ),
    );
  }
}
