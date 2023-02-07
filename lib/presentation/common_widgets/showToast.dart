import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> toastBomtom(
    {required BuildContext context, required String lb}) {
  final scaffold = ScaffoldMessenger.of(context);
  return scaffold.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(lb),
      action:
          SnackBarAction(label: 'ปิด', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
