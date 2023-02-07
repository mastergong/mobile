import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:psucoop_mobile/presentation/screens/home_screen/model/bloc/token/token_bloc.dart';

import '../../../../data/data_providers/data_provider.dart';
import '../../../../data/models_json/token.dart';
import '../../../common_widgets/alert.dart';
import '../../../common_widgets/template_screen.dart';
import '../event/home_timer_even.dart';
import '../model/bloc/home_active/home_active_bloc.dart';
import '../model/bloc/tab_select/tab_select_bloc.dart';
import 'pages/paege_notification_widget.dart';
import 'pages/page_home_widget.dart';
import 'pages/page_setting_widget.dart';
import 'pages/page_transaction_widget.dart';
import 'widgets/bottom_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class Pages {
  Widget page;
  int itemIndex;
  bool active;
  Pages({
    required this.page,
    required this.itemIndex,
    required this.active,
  });
}

List<Pages> getPage({required BuildContext context}) {
  List<Pages> list = [];

  list.add(Pages(
    page: pageHome(context: context),
    itemIndex: 0,
    active: true,
  ));
  list.add(Pages(
    page: pageTransaction(context: context),
    itemIndex: 1,
    active: true,
  ));
  list.add(Pages(
    page: pageNotification(context: context),
    itemIndex: 2,
    active: true,
  ));
  list.add(Pages(
    page: pageSetting(context: context),
    itemIndex: 3,
    active: true,
  ));

  return list;
}

class _HomeScreen extends State<HomeScreen> with WidgetsBindingObserver {
  Timer? timer;
  bool isRefresh = true;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(minutes: 6), (Timer t) {
      if (isRefresh) evenTokenExpCheck();
    });
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    timer?.cancel();
    super.dispose();
  }

  Future<bool> onTrue() async {
    exitApp(context: context);
    return true;
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        isRefresh = true;
        TokenInfo.isExpired().then((value) {
          context
              .read<TokenBloc>()
              .add(value ? EvenTokenIsExpire() : EvenTokenIsReady());

          if (!value) context.read<HomeActiveBloc>().add(EventHomeActive());
        });

        debugPrint('AppLifecycleState.resumed');
        break;
      case AppLifecycleState.inactive:
        isRefresh = false;
        context.read<HomeActiveBloc>().add(EventHomePaused());
        debugPrint('AppLifecycleState.inactive');
        break;
      case AppLifecycleState.paused:
        isRefresh = false;
        context.read<HomeActiveBloc>().add(EventHomePaused());
        break;
      case AppLifecycleState.detached:
        debugPrint('AppLifecycleState.detached');
        blocClose();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TokenBloc, TokenState>(
      listenWhen: (context, state) {
        return state is StateTokenAuthenIsExpire ||
            state is StateSubTokenAuthenIsExpire;
      },
      listener: (context, state) {
        if (state is StateTokenAuthenIsExpire) {
          toekenexpire(context: context);
        }
      },
      buildWhen: (context, state) {
        return state is StateTokenInitial ||
            state is StateTokenAuthenIsReady ||
            state is StateTokenAuthenIsRefresh;
      },
      builder: (context, state) {
        return BlocBuilder<TabSelectBloc, TabSelectState>(
          builder: (context, state) {
            return TemplateScreen(
              onWillPop: () => onTrue(),
              appBar: state.indexSelect == 2 || state.indexSelect == 3
                  ? true
                  : false,
              appbarlabel: state.indexSelect == 2 ? 'การแจ้งเตือน' : 'ตั้งค่า',
              navigationBar: bottomTab(context: context),
              child: Center(
                child: getPage(context: context)
                    .where((e) => e.itemIndex == state.indexSelect)
                    .first
                    .page,
              ),
            );
          },
        );
      },
    );
  }
}
