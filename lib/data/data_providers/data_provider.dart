import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psucoop_mobile/presentation/screens/home_screen/model/bloc/token/token_bloc.dart';

import '../../presentation/routes/bloc/app_router_bloc.dart';
import '../../presentation/screens/coopNetwork_screen/api/coopId_api.dart';
import '../../presentation/screens/coopNetwork_screen/api/coop_code/coop_code_bloc.dart';
import '../../presentation/screens/home_screen/model/bloc/home_active/home_active_bloc.dart';
import '../../presentation/screens/home_screen/model/bloc/tab_select/tab_select_bloc.dart';
import '../../presentation/screens/interest_rate_screen/api/interestConnect.dart';
import '../../presentation/screens/interest_rate_screen/api/model/bloc/interestBloc.dart';
import '../../presentation/screens/login_screen/api/login_api.dart';
import '../../presentation/screens/login_screen/api/login_bloc/login_bloc.dart';
import '../../presentation/screens/login_screen/model/bloc/form_validation/form_validation_bloc.dart';
import '../../presentation/screens/login_screen/model/bloc/showhidden_pwd/showhidden_pwd_bloc.dart';
import '../../presentation/screens/share_dividen_screen/api/bloc/share_dividen_bloc.dart';
import '../../presentation/screens/share_dividen_screen/api/share_dividen_api.dart';
import '../../presentation/screens/user_info_screen/api/user_info_api.dart';
import '../../presentation/screens/user_info_screen/api/bloc/user_info_bloc.dart';

final viewpassBloc = ShowHiddenPwdBloc();
final tebselectBloc = TabSelectBloc();
final loginBloc = LoginBloc(LoginApi());
final formValidateBloc = FormValidateBloc();
final coopCodeBloc = CoopCodeBloc(COOPIDApi());
final tokenBloc = TokenBloc();
final homeActiveBloc = HomeActiveBloc();
final appRouterBloc = AppRouterBloc();
final coopInterBloc = CoopInterestInfoBloc(COOPDIOApi());
final userInfoBloc = UserInfoBloc(UserInfoApi());
final coopInterestInfoBloc = CoopInterestInfoBloc(COOPDIOApi());
final shareDividenBloc = ShareDividenBloc(ShareDividenApi());

List<BlocProvider> AppBlocProviders() {
  var viewpass =
      BlocProvider<ShowHiddenPwdBloc>(create: (context) => viewpassBloc);
  var tebselect =
      BlocProvider<TabSelectBloc>(create: (context) => tebselectBloc);

  var login = BlocProvider<LoginBloc>(create: (context) => loginBloc);

  var formValidate =
      BlocProvider<FormValidateBloc>(create: (context) => formValidateBloc);

  var coopCode = BlocProvider<CoopCodeBloc>(create: (context) => coopCodeBloc);
  var userInfoProvider =
      BlocProvider<UserInfoBloc>(create: (context) => userInfoBloc);
  var token = BlocProvider<TokenBloc>(create: (context) => tokenBloc);
  var homeActive =
      BlocProvider<HomeActiveBloc>(create: (context) => homeActiveBloc);

  var coopInter =
      BlocProvider<CoopInterestInfoBloc>(create: (context) => coopInterBloc);
  var shareDividenProvider =
      BlocProvider<ShareDividenBloc>(create: (context) => shareDividenBloc);

  return [
    viewpass,
    tebselect,
    login,
    formValidate,
    coopCode,
    token,
    homeActive,
    userInfoProvider,
    coopInter,
    shareDividenProvider
  ];
}

void blocClose() {
  try {
    viewpassBloc.close();
    tebselectBloc.close();
    loginBloc.close();
    formValidateBloc.close();
    coopCodeBloc.close();
    tokenBloc.close();
    homeActiveBloc.close();
    coopInterestInfoBloc.close();
    userInfoBloc.close();
    coopInterBloc.close();
    shareDividenBloc.close();
    // ignore: empty_catches
  } catch (e) {}
}
