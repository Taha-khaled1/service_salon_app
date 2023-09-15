import 'package:flutter/material.dart';

class CustomTextfeild extends StatelessWidget {
  final String titel;
  final bool? obsecuer;
  final IconData? icon;
  final IconData? suffixIcon;
  final void Function()? iconontap;
  final String? Function(String?)? onsaved;
  final String? Function(String?)? valid;
  final double width, height;
  final TextDirection? textDirection;
  final String? inialvalue;
  final BorderStyle? isBoarder;
  final int? maxLines;
  final Color? fillColor;
  final bool? isenabledBorder;
  final bool readOnly;
  final void Function()? onTap;
  final String? text;

  const CustomTextfeild({
    Key? key,
    this.iconontap,
    this.obsecuer,
    this.icon,
    this.suffixIcon,
    required this.valid,
    required this.onsaved,
    required this.titel,
    required this.width,
    required this.height,
    this.textDirection,
    this.inialvalue,
    this.isBoarder,
    this.maxLines,
    this.fillColor,
    this.isenabledBorder = true,
    this.readOnly = false,
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Column(
        children: [
          if (text != null)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                text!,
                style: TextStyle(
                  color: Colors.white, // Change to desired text color
                  fontSize: 20, // Change to desired font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          TextFormField(
            onTap: onTap,
            readOnly: readOnly,
            initialValue: inialvalue,
            textDirection: textDirection,
            obscureText: obsecuer == null ? false : obsecuer!,
            onSaved: onsaved,
            validator: valid,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: icon != null
                  ? IconButton(
                      onPressed: iconontap,
                      icon: Icon(
                        icon,
                        color: Colors.white, // Change to desired icon color
                      ),
                    )
                  : null,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: iconontap,
                      icon: Icon(
                        suffixIcon,
                        color: Colors.white, // Change to desired icon color
                      ),
                    )
                  : null,
              enabledBorder: isenabledBorder == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        width: 1.2,
                        style: isBoarder ?? BorderStyle.solid,
                        color: Colors.grey, // Change to desired border color
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: BorderSide(
                        width: 0,
                        color: Colors.transparent, // No border
                      ),
                    ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
                borderSide: BorderSide(
                  width: 1.2,
                  color: Colors.grey, // Change to desired focused border color
                ),
              ),
              filled: true,
              fillColor: fillColor ??
                  Colors.white.withOpacity(0.2), // Change to desired fill color
              hintText: titel,
              hintStyle: TextStyle(
                color: Colors.white, // Change to desired hint text color
                fontSize: 16, // Change to desired hint font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
