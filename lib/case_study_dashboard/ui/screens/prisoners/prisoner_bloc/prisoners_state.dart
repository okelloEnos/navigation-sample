part of 'prisoners_bloc.dart';

abstract class PrisonersState extends Equatable {
  const PrisonersState();
}

class PrisonersInitial extends PrisonersState {
  @override
  List<Object> get props => [];
}

class PrisonersTestLoading extends PrisonersState {
  @override
  List<Object> get props => [];
}

class PrisonersTestingError extends PrisonersState {
  @override
  List<Object> get props => [];
}

class PrisonersTestSuccess extends PrisonersState {
  final List<OffenderModel> listOfOffenders;

  const PrisonersTestSuccess({required this.listOfOffenders});

  @override
  List<Object> get props => [listOfOffenders];
}

class PrisonersLoading extends PrisonersState {
  @override
  List<Object> get props => [];
}

class PrisonersError extends PrisonersState {
  final String errorText;

  const PrisonersError({required this.errorText});

  @override
  List<Object> get props => [errorText];
}

class PrisonersSuccess extends PrisonersState {
  final List<PrisonerProfile> listOfOffenders;

  const PrisonersSuccess({required this.listOfOffenders});

  @override
  List<Object> get props => [listOfOffenders];
}

class PrisonerInfoCollectedSuccess extends PrisonersState {
  final PrisonerInfo info;

  const PrisonerInfoCollectedSuccess({required this.info});

  @override
  List<Object> get props => [info];
}

class PrisonerEnrollmentLoading extends PrisonersState {
  @override
  List<Object> get props => [];
}

class PrisonerEnrollmentError extends PrisonersState {
  final String errorText;

  const PrisonerEnrollmentError({required this.errorText});

  @override
  List<Object> get props => [errorText];
}

class PrisonerEnrollmentSuccess extends PrisonersState {
  final int prisonerId;

  const PrisonerEnrollmentSuccess({required this.prisonerId});

  @override
  List<Object> get props => [prisonerId];
}

class PrisonerArrestLoading extends PrisonersState {
  @override
  List<Object> get props => [];
}

class PrisonerArrestFailure extends PrisonersState {
  final String errorText;

  const PrisonerArrestFailure({required this.errorText});

  @override
  List<Object> get props => [errorText];
}

class PrisonerArrestSuccess extends PrisonersState {

  @override
  List<Object> get props => [];
}

class PrisonerTransferLoading extends PrisonersState {
  @override
  List<Object> get props => [];
}

class PrisonerTransferFailure extends PrisonersState {
  final String errorText;

  const PrisonerTransferFailure({required this.errorText});

  @override
  List<Object> get props => [errorText];
}

class PrisonerTransferSuccess extends PrisonersState {

  @override
  List<Object> get props => [];
}

class PrisonerReleaseLoading extends PrisonersState {
  @override
  List<Object> get props => [];
}

class PrisonerReleaseFailure extends PrisonersState {
  final String errorText;

  const PrisonerReleaseFailure({required this.errorText});

  @override
  List<Object> get props => [errorText];
}

class PrisonerReleaseSuccess extends PrisonersState {

  @override
  List<Object> get props => [];
}