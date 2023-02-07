// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../../core/local/key_value_storage_base.dart';
import '../../../../../data/models_json/resultState.dart';
import '../../model/json/login.dart';
import '../../model/json/login_failed.dart';
import '../login_api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginApi _loginApi;
  LoginBloc(this._loginApi) : super(LoginInitialState()) {
    on<LoggingEvent>((event, emit) async {
      try {
        emit(LoggingState());

        final login =
            await _loginApi.logIn(membNo: event.membNo, membPwd: event.membPwd);

        if (login.status.code == 0 && login.data != null) {
          var loginResponse = Login.fromJson(login.data);

          // set token to storge
          if (loginResponse.token != null) {
            Future.delayed(
              const Duration(milliseconds: 10),
              () => KeyValueStorageBase()
                ..setAuthToken(loginResponse.token ?? '')
                ..setRefreshToken(loginResponse.refreshToken ?? ''),
            );

            // emit login csuccess
            emit(LoginSuccessState(loginResponse));
          } else {
            emit(LoginErrorState(loginResponse.token.toString()));
          }
        } else {
          emit(LoginErrorState(login.status.description));
        }
      } on DioError catch (e) {
        var stsRes =
            StatusResponse.fromJson(e.response!.data as Map<String, dynamic>);

        if (stsRes.data != null) {
          emit(LoginErrorManualState(Loginfailed.fromJson(stsRes.data)));
        } else {
          emit(LoginErrorMSubanualState(e.toString()));
        }
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
    on<LoginfailedEvent>((event, emit) async {
      emit(LoggingState());
    });

    on<LoginNextEvent>((event, emit) async {
      emit(LoginInitialState());
    });
  }
}
