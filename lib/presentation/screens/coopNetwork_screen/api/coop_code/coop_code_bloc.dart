import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models_json/resultState.dart';
import '../../model/json/coop_model.dart';
import '../coopId_api.dart';

part 'coop_code_event.dart';
part 'coop_code_state.dart';

class CoopCodeBloc extends Bloc<CoopIdEvent, CoopCodeState> {
  final COOPIDApi _coopApi;
  CoopCodeBloc(this._coopApi) : super(CoopCodeInitialState()) {
    on<GetCoopcodeEvent>((event, emit) async {
      try {
        emit(CoopCodeLoadState());

        final coopCode = await _coopApi.getCoopId(coopCode: event.coopCode);

        emit(CoopCodeGetSuccessState(CoopModel.fromJson(coopCode.data)));
      } on DioError catch (e) {
        var stsRes =
            StatusResponse.fromJson(e.response!.data as Map<String, dynamic>);

        emit(CoopCodeError(stsRes.status.description));
      } catch (e) {
        emit(CoopCodeError(e.toString()));
      }
    });

    on<GetCoopcodeChangeTextEvent>((event, emit) async {
      emit(CoopCodeChangeValueState());
    });
  }
}
