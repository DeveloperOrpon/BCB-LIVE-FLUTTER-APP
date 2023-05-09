import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isBorderEnabeld;
  final String? labelText;
  final String? hintText;
  final Color? backgroundColor;
  final String? prefixText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool autofocus;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool isRequired;
  final bool expandes;
  final bool? enabled;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final Widget? suffixIcon;
  final Color borderSideColor;
  final double topLeftBorderRadius;
  final double topRightBorderRadius;
  final double bottomLeftBorderRadius;
  final double bottomRightBorderRadius;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(bool)? onFocusChange;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function()? onTap;

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.isRequired = false,
    this.enabled = true,
    this.suffixIcon,
    this.prefixText,
    this.style,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.onChanged,
    this.autofocus = false,
    this.onTap,
    this.expandes = false,
    this.marginTop = 10.0,
    this.marginBottom = 10.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.hintStyle,
    this.borderSideColor = Colors.grey,
    this.isBorderEnabeld = true,
    this.labelStyle,
    this.topLeftBorderRadius = 5.0,
    this.topRightBorderRadius = 5.0,
    this.bottomLeftBorderRadius = 5.0,
    this.bottomRightBorderRadius = 5.0,
    this.errorText,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.contentPadding =
        const EdgeInsets.only(left: 10, right: 10.0, bottom: 10, top: 10),
    this.onFieldSubmitted,
    this.onSaved,
    this.onEditingComplete,
    this.onFocusChange,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        marginLeft,
        marginTop,
        marginRight,
        marginBottom,
      ),
      // decoration: const BoxDecoration(
      //   color: CustomColors.white,
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(5),
      //   ),
      // ),
      child: Focus(
        onFocusChange: onFocusChange,
        child: TextFormField(
          onTap: onTap,
          readOnly: readOnly,
          focusNode: focusNode,
          autofocus: autofocus,
          enabled: enabled,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          style: style,
          expands: expandes,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            fillColor: backgroundColor,
            filled: true,
            contentPadding: contentPadding,
            // EdgeInsets.only(
            //     left: 10.0,
            //     top: maxLines! > 1 ? 25 : 30,
            //     bottom: maxLines! > 1 ? 15 : 0),
            isDense: true,

            border: isBorderEnabeld
                ? OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(bottomLeftBorderRadius),
                      bottomRight: Radius.circular(bottomRightBorderRadius),
                      topLeft: Radius.circular(topLeftBorderRadius),
                      topRight: Radius.circular(topRightBorderRadius),
                    ),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
            counterText: '',
            focusedBorder: isBorderEnabeld
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(bottomLeftBorderRadius),
                      bottomRight: Radius.circular(bottomRightBorderRadius),
                      topLeft: Radius.circular(topLeftBorderRadius),
                      topRight: Radius.circular(topRightBorderRadius),
                    ),
                    borderSide: const BorderSide(
                      color: Colors.black26,
                    ),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
            enabledBorder: isBorderEnabeld
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(bottomLeftBorderRadius),
                      bottomRight: Radius.circular(bottomRightBorderRadius),
                      topLeft: Radius.circular(topLeftBorderRadius),
                      topRight: Radius.circular(topRightBorderRadius),
                    ),
                    borderSide: BorderSide(
                      color: borderSideColor,
                    ))
                : const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),

            hintText: hintText,
            hintStyle: hintStyle,
            prefixIcon: prefixIcon,
            prefixText: prefixText,
            prefixStyle: style,
            suffixIcon: suffixIcon,
            errorText: errorText,
          ),
          textAlign: textAlign,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onEditingComplete: onEditingComplete,
        ),
      ),
    );
  }
}
