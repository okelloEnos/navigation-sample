part of 'prisoners_bloc.dart';

abstract class PrisonersEvent extends Equatable {
  const PrisonersEvent();
}
class PrisonersTestFetched extends PrisonersEvent{
  @override
  List<Object?> get props => [];
}

class PrisonersFetched extends PrisonersEvent{
  @override
  List<Object?> get props => [];
}

// class PrisonersSearchEvent extends PrisonersEvent{
//   final List<OffenderModel> listOfOffenders;
//   final String query;
//
//   const PrisonersSearchEvent({required this.query, required this.listOfOffenders});
//
//   @override
//   List<Object?> get props => [query, listOfOffenders];
// }

class CollectedPrisonerInfoEvent extends PrisonersEvent{
  final PrisonerInfo prisonerInfo;

  const CollectedPrisonerInfoEvent({required this.prisonerInfo});

  @override
  List<Object?> get props => [prisonerInfo];

}

class PrisonerEnrollEvent extends PrisonersEvent{
  final PrisonerInfo prisonerInfo;

  const PrisonerEnrollEvent({required this.prisonerInfo});

  @override
  List<Object?> get props => [prisonerInfo];
}

class PrisonerArrestEvent extends PrisonersEvent{
  final ArrestInfo arrestInfo;

  const PrisonerArrestEvent({required this.arrestInfo});

  @override
  List<Object?> get props => [arrestInfo];
}

class PrisonerPrisonTransferEvent extends PrisonersEvent{
  final TransferData transferData;

  const PrisonerPrisonTransferEvent({required this.transferData});

  @override
  List<Object?> get props => [transferData];
}

class PrisonerCourtTransferEvent extends PrisonersEvent{
  final TransferData transferData;

  const PrisonerCourtTransferEvent({required this.transferData});

  @override
  List<Object?> get props => [transferData];
}

class PrisonerHospitalTransferEvent extends PrisonersEvent{
  final TransferData transferData;

  const PrisonerHospitalTransferEvent({required this.transferData});

  @override
  List<Object?> get props => [transferData];
}
class PrisonerWorkTransferEvent extends PrisonersEvent{
  final TransferData transferData;

  const PrisonerWorkTransferEvent({required this.transferData});

  @override
  List<Object?> get props => [transferData];
}

class PrisonerCourtReleaseEvent extends PrisonersEvent{
  final ReleaseData releaseData;

  const PrisonerCourtReleaseEvent({required this.releaseData});

  @override
  List<Object?> get props => [releaseData];
}

class PrisonerHospitalReleaseEvent extends PrisonersEvent{
  final ReleaseData releaseData;

  const PrisonerHospitalReleaseEvent({required this.releaseData});

  @override
  List<Object?> get props => [releaseData];
}

class PrisonerWorkReleaseEvent extends PrisonersEvent{
  final ReleaseData releaseData;

  const PrisonerWorkReleaseEvent({required this.releaseData});

  @override
  List<Object?> get props => [releaseData];
}

class PrisonerPrisonReleaseEvent extends PrisonersEvent{
  final ReleaseData releaseData;

  const PrisonerPrisonReleaseEvent({required this.releaseData});

  @override
  List<Object?> get props => [releaseData];
}