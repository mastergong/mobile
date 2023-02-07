import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:psucoop_mobile/presentation/screens/home_screen/model/bloc/token/token_bloc.dart';
import 'package:psucoop_mobile/presentation/screens/login_screen/model/json/login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'authenApp.dart';
import 'core/local/key_value_storage_base.dart';
import 'core/themes/app_color.dart';
import 'core/themes/app_text.dart';
import 'core/themes/app_theme.dart';
import 'data/data_providers/bloc_observer.dart';
import 'data/data_providers/data_provider.dart';
import 'data/models_json/token.dart';
import 'presentation/routes/app_router.dart';
import 'presentation/routes/routes.dart';
import 'presentation/screens/coopNetwork_screen/view/coopNetwork_screen.dart';
import 'presentation/screens/home_screen/model/bloc/home_active/home_active_bloc.dart';
import 'presentation/screens/home_screen/view/home_screen.dart';
import 'presentation/screens/login_screen/view/login_screen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(
    Phoenix(
      child: const PSUCOOPAPP(),
    ),
  );
}

class PSUCOOPAPP extends StatefulWidget {
  const PSUCOOPAPP({Key? key}) : super(key: key);

  @override
  State<PSUCOOPAPP> createState() => _PSUCOOPAPPState();
}

class _PSUCOOPAPPState extends State<PSUCOOPAPP> {
  List<BlocProvider> appBlocProviders = [];

  final keyBase = KeyValueStorageBase();
  @override
  void initState() {
    appBlocProviders = AppBlocProviders();
    keyBase.clearEncrypted();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ));

    const showDebugBanner = true;

    return MultiBlocProvider(
      providers: appBlocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: showDebugBanner,
        title: 'PSUCOOP MOBILE',
        theme: AppTheme.light,
        themeMode: ThemeMode.light,
        initialRoute: Routes.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: AppRouter.navigatorKey,
      ),
    );
  }
}
