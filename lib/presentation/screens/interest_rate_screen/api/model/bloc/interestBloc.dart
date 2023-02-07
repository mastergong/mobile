import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
//import 'package:psucoop_mobile/presentation/screens/interest_screen/api/model/json/interestLoan.dart';
//import 'package:psucoop_mobile/presentation/screens/interest_screen/api/model/json/interestSavingFixed.dart';

import '../../../../../../data/models_json/resultState.dart';
//import '../../model/json/coop_model.dart';
import '../json/interestSavingModel.dart';
import '../json/interestSavingFixedModel.dart';
import '../json/interestLoanModel.dart';
//import '../coopId_api.dart';
import '../../interestConnect.dart';

part 'interestEvent.dart';
part 'interestState.dart';

class CoopInterestInfoBloc extends Bloc<CoopIdEvent, CoopInfoState> {
  final COOPDIOApi _coopApi;
  CoopInterestInfoBloc(this._coopApi) : super(CoopInterestInfoInitialState()) {
    on<GetCoopcodeEvent>((event, emit) async {
      try {
        emit(CoopInterestInfoLoadState());

        var rates = await Future.wait([
          _coopApi.getInterestSavingInfo(),
          _coopApi.getInterestSavingFixedInfo(),
          _coopApi.getInterestLoan()
        ]);
        //final coopCode = await  _coopApi.getInterestSavingInfo();
        // final interestSavingInfo = await _coopApi.getInterestSavingInfo();
        // final interestSavingFixedInfo = await _coopApi.getInterestSavingFixedInfo();
        // final interestLoanInfo = await _coopApi.getInterestLoan();

        var interestListSavingModel = (rates[0].data as List)
            .map((element) =>
                InterestSavingModel.fromJson(element as Map<String, dynamic>))
            .toList();
        var interestListSavingFixedModel = (rates[1].data as List)
            .map((element) => InterestSavingFixedModel.fromJson(
                element as Map<String, dynamic>))
            .toList();
        var interestLoanModel = (rates[2].data as List)
            .map((element) =>
                InterestLoanModel.fromJson(element as Map<String, dynamic>))
            .toList();

        emit(CoopGetInterestInfo(
            interestSavingModel: interestListSavingModel,
            interestSavingFixedModel: interestListSavingFixedModel,
            interestLoanModel: interestLoanModel));
      } on DioError catch (e) {
        var stsRes =
            StatusResponse.fromJson(e.response!.data as Map<String, dynamic>);

        emit(CoopInterestInfoError(stsRes.status.description));
      } catch (e) {
        emit(CoopInterestInfoError(e.toString()));
      }
    });
  }
}
