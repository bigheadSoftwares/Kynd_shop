import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onTap,
    this.backgroundColor,
    this.elevation,
    this.radius,
    this.width,
    this.child,
    this.padding,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? child;
  final double? elevation;
  final double? borderWidth;
  final double? width;
  final double? radius;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? screenWidth(context),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation ?? 0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 0,
              ),
              borderRadius: BorderRadius.circular(radius ?? 0.0),
            ),
          ),
          padding: MaterialStateProperty.all(padding ?? EdgeInsets.zero),
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? Colors.blue),
        ),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
