import 'package:dio/dio.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models_json/resultState.dart';
import '../../model/json/share_dividen_data.dart';
import '../share_dividen_api.dart';

part 'share_dividen_event.dart';
part 'share_dividen_state.dart';

class ShareDividenBloc extends Bloc<ShareDividenEvent, ShareDividenState> {
  final ShareDividenApi _shareDividenApi;

  ShareDividenBloc(this._shareDividenApi) : super(StateShareDividenInitial()) {
    on<EventShareDividenFetching>((event, emit) async {
      try {
        final oApiResponse = await _shareDividenApi.fetch();

        if (oApiResponse.status.code == 0) {
          if (oApiResponse.data.length > 0) {
            ShareDividens shareDividens =
                ShareDividens(rawDividens: oApiResponse.data);

            if (kDebugMode) {
              print(
                  "ShareDividenBloc::on<EventoShareDividenFetching> >> shareDividens: ${shareDividens.toString()}");
            }

            //Raise event with the new state/data
            emit(StateShareDividenFetchSuccess(shareDividens));
          }
        } else {
          //Raise event Fail
          emit(StateShareDividenFetchFail(
              ShareDividenData.fromMap(oApiResponse.data.status)));
        }
      } on DioError catch (e) {
        var stsRes =
            StatusResponse.fromJson(e.response!.data as Map<String, dynamic>);

        emit(StateShareDividenFetchFail(ShareDividenData.fromMap(stsRes.data)));
      } catch (e) {
        emit(StateShareDividenFetchError(e.toString()));
      }
    });
  }
}
