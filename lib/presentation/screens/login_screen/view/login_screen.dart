import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psucoop_mobile/data/helpers/context_ext.dart';
import 'package:psucoop_mobile/presentation/common_widgets/alert.dart';
import 'package:psucoop_mobile/presentation/routes/app_router.dart';

import '../../../common_widgets/showToast.dart' as showToast;
import '../../../common_widgets/sizebox_widgets.dart';
import '../../../common_widgets/template_screen.dart';
import '../../../routes/routes.dart';
import '../../home_screen/model/bloc/token/token_bloc.dart';
import '../api/login_bloc/login_bloc.dart';
import '../event/login_widget_event.dart';
import '../model/bloc/form_validation/form_validation_bloc.dart';
import 'widgets/loginFootpag.dart';
import 'widgets/loginForm.dart';
import 'widgets/loginHeader.dart';

const double defaultPadding = 16.0;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    ctrTextpasswd.text = '';
    ctrTextusername.text = '';
    membNoFocusNode.addListener(() {
      if (!membNoFocusNode.hasFocus) {
        context.read<FormValidateBloc>().add(MembNoUnfocusedEvent());
        FocusScope.of(context).requestFocus(passwordFocusNode);
      }
    });
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        context.read<FormValidateBloc>().add(PasswordUnfocusedEvent());
      }
    });

    super.initState();
  }

  Future<bool> onFalse() async {
    showToast.toastBomtom(context: context, lb: 'กรุณารอสักครู่.......');
    return false;
  }

  Future<bool> onTrue() async {
    exitApp(context: context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listenWhen: (context, state) {
      return state is LoginSuccessState || state is LoginErrorManualState;
    }, listener: (context, state) {
      if (state is LoginSuccessState) {
        context.read<TokenBloc>().add(EvenTokenIsReady());
        AppRouter.popAndPushNamed(
          Routes.homeScreenRoute,
        );
      }
      if (state is LoginErrorManualState) {
        loginfailed(context: context);
      }
    }, buildWhen: (context, state) {
      return state is LoginInitialState ||
          state is LoggingState ||
          state is LoginErrorManualState;
    }, builder: (context, state) {
      return TemplateScreen(
        onWillPop: (state is LoggingState) ? onFalse : onTrue,
        isLoading: (state is LoggingState),
        //appBar: true,
        label: 'กรุณารอสักครู่....',
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: context.screenHeight,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Login_header(),
                  sizeboxHeight(20),
                  Login_form(
                      userFocusNode: membNoFocusNode,
                      passwordFocusNode: passwordFocusNode,
                      context: context,
                      lbError: (state is LoginErrorManualState)
                          ? 'กรอกเลขสมาชิกหรือรหัสผ่านผิดครั้งที่ ${state.failed.consecutiveLock}'
                          : ''),
                  sizeboxHeight(20),
                  Login_footpagmenu(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
