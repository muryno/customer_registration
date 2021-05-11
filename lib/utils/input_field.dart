import 'package:customer_registration/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


///Generic Input field class to solve DRY Principle and Single responsibility(SOLID Principle)

InputDecoration getInputDecoration({
  @required String label,
  String hint,
  double fontSize,
  bool error,
  Widget suffixIcon,
  Widget prefixIcon,
  Widget suffix,
  Color color,
   InputBorder border,
     Color fillColor,
   bool filled,
}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,

    suffix: suffix,
    hintText: hint,
    labelStyle: TextStyle(
      fontSize: fontSize?? 14,
      color: error == true ? AppColors.errorColor : color,
    ),
    hintStyle: TextStyle(
        fontSize:fontSize ?? 14.0,
        color: error == true
            ? AppColors.errorColor
            : (Colors.grey)),

                      filled: true,
    fillColor: fillColor ?? Color(0XFFD8D8D8).withOpacity(0.4),
    border: border !=null? border : OutlineInputBorder(


        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: error == true ? AppColors.errorColor : (color ?? Colors.grey),
        )),


    focusedBorder:OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 2.0),
      borderRadius: BorderRadius.circular(5.0),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide(
        color:  Colors.grey.withOpacity(0.2),
        width: 2.0,
      ),
    ),
  );
}



class InputField extends StatelessWidget {
  const InputField( {
    Key key,
    this.label,
    this.controller,
    FocusNode node,
    this.type,
    this.hint,
    this.color,
    this.focusedColor,
    this.maxLines,
    this.maxLength,
    this.obscureText,
    this.error,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.hintColor,
    this.textColor,
    this.message,
    this.suffixIcon,
    this.suffix,
    this.prefixIcon,
    this.border,
    this.filled,
    this.fillColor,
    this.textAlign,
    this.fontSize,
    this.enable= true, value,

  })  : _node = node,
        super(key: key);

  final TextEditingController controller;
  final FocusNode _node;
  final TextInputType type;

  final double fontSize;
  final String label;
  final String hint;
  final String message;
  final bool obscureText;
  final bool error;
  final int maxLines;
  final int maxLength;
  final InputBorder border;
  final   Color fillColor;
  final bool filled;
  final bool enable ;
  final Widget suffix;
  final TextAlign textAlign;

  /// The color of the border
  final Color color;

  /// The color of the border and label when the input is focused
  final Color focusedColor;

  /// The color of the hint text
  final Color hintColor;

  /// The color of the input value
  final Color textColor;

  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function(String) validator;

  final Widget prefixIcon;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          enabled: enable,
          maxLines: maxLines ?? 1,
          controller: controller,
          focusNode: _node,

          textInputAction: textInputAction ?? TextInputAction.next,
          autocorrect: false,
          keyboardType: type,
          obscureText: obscureText ?? false,
          onChanged: onChanged,
          validator: validator,
          style: TextStyle(
            fontSize:  fontSize ?? 15,
            color: textColor ?? Colors.black,
          ),
          maxLength: maxLength,

          decoration: getInputDecoration(
              label: label,
              color: color,
              error: error,

              fillColor: fillColor?? Color(0XFFF9F9F9),

              fontSize: fontSize,
              hint: hint,

              prefixIcon: prefixIcon,

              suffix: suffix,

              suffixIcon: suffixIcon),
            textAlign: textAlign ?? TextAlign.left

        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            message ?? '',
            style: TextStyle(
              fontSize: 12.0,
              color: error == true ? AppColors.errorColor : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
