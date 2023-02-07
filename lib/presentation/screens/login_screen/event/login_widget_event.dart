import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/login_bloc/login_bloc.dart';
import '../model/bloc/showhidden_pwd/showhidden_pwd_bloc.dart';

final ctrTextusername = TextEditingController();
final ctrTextpasswd = TextEditingController();

final membNoFocusNode = FocusNode();
final passwordFocusNode = FocusNode();

Future<void> onLogin({
  required BuildContext context,
}) async {
  context.read<LoginBloc>().add(
      LoggingEvent(membNo: ctrTextusername.text, membPwd: ctrTextpasswd.text));
}

void showOrHiddenPassword(
    {required BuildContext context, required bool value}) {
  context
      .read<ShowHiddenPwdBloc>()
      .add(value ? HiddenPwdEvent() : ShowPwdEvent());
}
