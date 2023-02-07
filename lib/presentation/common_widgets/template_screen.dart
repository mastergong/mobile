import 'package:flutter/material.dart';
import 'package:psucoop_mobile/core/themes/app_text.dart';

import '../../core/themes/app_color.dart';
import '../../core/themes/app_icon.dart';
import '../../core/themes/app_images.dart';
import 'alert.dart';
import 'loadingOverlay.dart';

class TemplateScreen extends StatelessWidget {
  final Widget child;
  final bool? isLoading;
  final String? label;
  final String appbarlabel;
  final Widget? navigationBar;
  final bool? appBar;
  final Widget? barWidget;
  final Future<bool> Function()? onWillPop;
  // ignore: use_key_in_widget_constructors
  const TemplateScreen({
    required this.child,
    this.navigationBar,
    this.label,
    this.appbarlabel = '',
    this.isLoading,
    this.appBar = false,
    this.onWillPop,
    this.barWidget,
  });

  _appbar({required BuildContext context, required Widget? barWidget}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: barWidget ??
          AppBar(
            backgroundColor: AppColor.primaryColor,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: Center(
              child: appbarlabel.isEmpty
                  ? Image.asset(
                      AppImages.psucoop_logo,
                      fit: BoxFit.cover,
                      height: 30,
                    )
                  : Text(
                      appbarlabel,
                      style: AppTextStyle.instance.titleDarkMedium,
                    ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  AppIcons.sigout,
                  size: 30,
                  color: AppColor.backgroundWhite,
                ),
                onPressed: () => exitApp(context: context),
              ),
            ],
            leading: Center(
              child: Image.asset(
                AppImages.avatar,
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: WillPopScope(
          onWillPop: onWillPop,
          child: Stack(
            children: [
              Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: AppColor.white,
                appBar: appBar == true
                    ? _appbar(context: context, barWidget: barWidget)
                    : null,
                body: LoadingOverlay(
                  label: label ?? '',
                  isLoading: isLoading ?? false,
                  child: child,
                ),
                bottomNavigationBar: navigationBar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
