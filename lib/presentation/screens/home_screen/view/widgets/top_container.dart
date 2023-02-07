import 'package:flutter/material.dart';
import 'package:psucoop_mobile/data/helpers/context_ext.dart';

import '../../../../../core/themes/app_color.dart';

class TopContainer extends StatelessWidget {
  final double? height;
  final double width;
  final Widget child;
  final EdgeInsets? padding;
  // ignore: use_key_in_widget_constructors
  const TopContainer(
      {required this.width, this.height, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        //  color: Color.fromRGBO(94, 114, 228, 1.0),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
      ),
      height: height ?? context.screenHeight / 3.2,
      width: width,
      child: child,
    );
  }
}
