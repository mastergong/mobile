import 'package:dio/dio.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models_json/resultState.dart';
import '../../api/user_info_api.dart';
import '../../model/json/user_info_data.dart';

part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  final UserInfoApi _userInfoApi;

  UserInfoBloc(this._userInfoApi) : super(StateUserInfoInitial()) {
    on<EventUserInfoFetching>((event, emit) async {
      try {
        final oApiResponse = await _userInfoApi.fetch();

        if (oApiResponse.status.code == 0) {
          //Raise event with the new state/data
          UserInfoData oUserInfo =
              UserInfoData.fromJson(oApiResponse.data["profile"]);

          if (kDebugMode) {
            print(
                "UserInfoBloc::on<EventUserInfoFetching> >> oUserInfo: ${oUserInfo.toString()}");
          }
          emit(StateUserInfoFetchSuccess(oUserInfo));
        } else {
          //Raise event Fail
          emit(StateUserInfoFetchFail(
              UserInfoData.fromJson(oApiResponse.data.status)));
        }
      } on DioError catch (e) {
        var stsRes =
            StatusResponse.fromJson(e.response!.data as Map<String, dynamic>);

        emit(StateUserInfoFetchFail(UserInfoData.fromJson(stsRes.data)));
      } catch (e) {
        emit(StateUserInfoFetchError(e.toString()));
      }
    });
  }
}
