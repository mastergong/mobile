part of 'interestBloc.dart';

abstract class CoopInfoState extends Equatable {
  const CoopInfoState();

  @override
  List<Object> get props => [];
}

class CoopInterestInfoInitialState extends CoopInfoState {}

class CoopInterestInfoLoadState extends CoopInfoState {}

class CoopGetInterestInfo extends CoopInfoState {
  final List<InterestSavingModel> interestSavingModel;
  final List<InterestSavingFixedModel> interestSavingFixedModel;
  final List<InterestLoanModel> interestLoanModel;
  const CoopGetInterestInfo(
      {required this.interestSavingModel,
      required this.interestSavingFixedModel,
      required this.interestLoanModel});

  @override
  List<Object> get props =>
      [interestSavingModel, interestSavingFixedModel, interestLoanModel];
}

class CoopInterestInfoError extends CoopInfoState {
  final String error;
  const CoopInterestInfoError(this.error);

  @override
  List<Object> get props => [error];
}
