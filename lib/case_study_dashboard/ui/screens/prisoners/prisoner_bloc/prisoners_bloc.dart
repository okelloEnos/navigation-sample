import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/arrest_data.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/offenderModel.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/prisoner_data_collection.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/prisoners_profile.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/release_data.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/transfer_data.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/repository/prisoners_repository.dart';
part 'prisoners_event.dart';
part 'prisoners_state.dart';

class PrisonersBloc extends Bloc<PrisonersEvent, PrisonersState> {
  PrisonerInfo prisonerInfo = PrisonerInfo();
  // final PrisonersRepository repository = PrisonersRepository();

  PrisonersBloc() : super(PrisonersInitial()) {
    on<CollectedPrisonerInfoEvent>(_onPrisonerInfoCollected);
    on<PrisonersTestFetched>(_onPrisonersTestFetching);
    // on<PrisonersSearchEvent>(_onSearching);
    on<PrisonerEnrollEvent>(_onPrisonerEnrollment);
    on<PrisonerArrestEvent>(_onPrisonerArrestedInfo);
    on<PrisonersFetched>(_onPrisonersFetching);
    on<PrisonerPrisonTransferEvent>(_onPrisonerPrisonTransfer);
    on<PrisonerCourtTransferEvent>(_onPrisonerCourtTransfer);
    on<PrisonerHospitalTransferEvent>(_onPrisonerHospitalTransfer);
    on<PrisonerWorkTransferEvent>(_onPrisonerWorkTransfer);
    on<PrisonerPrisonReleaseEvent>(_onPrisonerPrisonRelease);
    on<PrisonerCourtReleaseEvent>(_onPrisonerCourtRelease);
    on<PrisonerHospitalReleaseEvent>(_onPrisonerHospitalRelease);
    on<PrisonerWorkReleaseEvent>(_onPrisonerWorkRelease);
  }

  void _onPrisonerInfoCollected(CollectedPrisonerInfoEvent event, Emitter<PrisonersState> emit) {

    PrisonerInfo receivedInfo = event.prisonerInfo;

    prisonerInfo = prisonerInfo.copyWith(
      fullName: receivedInfo.fullName,
      idNumber: receivedInfo.idNumber,
      phone: receivedInfo.phone,
      dateOfBirth: receivedInfo.dateOfBirth,
      placeOfBirth: receivedInfo.placeOfBirth,
      placeOfResidence: receivedInfo.placeOfResidence,
      selfieCapture: receivedInfo.selfieCapture,
      frontId: receivedInfo.frontId,
      backId: receivedInfo.backId,
      kinName: receivedInfo.kinName,
      kinPhone: receivedInfo.kinPhone,
      relationship: receivedInfo.relationship,
    );
    emit(PrisonerInfoCollectedSuccess(info: prisonerInfo));
  }

  void _onPrisonersFetching(PrisonersFetched event, Emitter<PrisonersState> emit) async{
    emit(PrisonersLoading());
    try{
      // final prisoners = await repository.retrievePrisonersList();
      emit(PrisonersSuccess(listOfOffenders: []));
    }
    on DioError catch (e){
      // emit(PrisonersError(errorText: 'Error: ${DioExceptions.fromDioError(e).toString()}'));
    }
    catch (e){
      emit(PrisonersError(errorText: e.toString()));
    }
  }

  void _onPrisonersTestFetching(PrisonersTestFetched event, Emitter<PrisonersState> emit) async{
    emit(PrisonersTestLoading());
    try{
      // final prisoners = await repository.listOfOffenderRequest();
      emit(PrisonersTestSuccess(listOfOffenders: []));
    }
    on DioError catch (e){
      emit(PrisonersTestingError());
    }
    catch (e){
      emit(PrisonersTestingError());
    }
  }

  void _onPrisonerEnrollment(PrisonerEnrollEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerEnrollmentLoading());
    try{
      // final responseId = await repository.prisonerEnrollRequest(info: prisonerInfo);
      emit(PrisonerEnrollmentSuccess(prisonerId: 0));
    }
    on DioError catch (e){
      // emit(PrisonerEnrollmentError(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerEnrollmentError(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerArrestedInfo(PrisonerArrestEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerArrestLoading());
    try{
      // final responseId = await repository.arrestRequest(info: event.arrestInfo);
      emit(PrisonerArrestSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerArrestFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerArrestFailure(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerPrisonTransfer(PrisonerPrisonTransferEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerTransferLoading());
    try{
      // final responseId = await repository.submitTransferRequest(info: event.transferData);
      emit(PrisonerTransferSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerTransferFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerTransferFailure(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerCourtTransfer(PrisonerCourtTransferEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerTransferLoading());
    try{
      // final responseId = await repository.submitTransferRequest(info: event.transferData);
      emit(PrisonerTransferSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerTransferFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerTransferFailure(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerHospitalTransfer(PrisonerHospitalTransferEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerTransferLoading());
    try{
      // final responseId = await repository.submitTransferRequest(info: event.transferData);
      emit(PrisonerTransferSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerTransferFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerTransferFailure(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerWorkTransfer(PrisonerWorkTransferEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerTransferLoading());
    try{
      // final responseId = await repository.submitTransferRequest(info: event.transferData);
      emit(PrisonerTransferSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerTransferFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerTransferFailure(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerPrisonRelease(PrisonerPrisonReleaseEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerReleaseLoading());
    try{
      // final responseId = await repository.submitReleaseRequest(info: event.releaseData);
      emit(PrisonerReleaseSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerReleaseFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerReleaseFailure(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerCourtRelease(PrisonerCourtReleaseEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerReleaseLoading());
    try{
      // final responseId = await repository.submitReleaseRequest(info: event.releaseData);
      emit(PrisonerReleaseSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerReleaseFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerReleaseFailure(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerHospitalRelease(PrisonerHospitalReleaseEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerReleaseLoading());
    try{
      // final responseId = await repository.submitReleaseRequest(info: event.releaseData);
      emit(PrisonerReleaseSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerReleaseFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerReleaseFailure(errorText: "Something went wrong"));
    }
  }

  void _onPrisonerWorkRelease(PrisonerWorkReleaseEvent event, Emitter<PrisonersState> emit) async{
    emit(PrisonerReleaseLoading());
    try{
      // final responseId = await repository.submitReleaseRequest(info: event.releaseData);
      emit(PrisonerReleaseSuccess());
    }
    on DioError catch (e){
      // emit(PrisonerReleaseFailure(errorText: DioExceptions.fromDioError(e).message ?? 'Something went wrong'));
    }
    catch (e){
      emit(const PrisonerReleaseFailure(errorText: "Something went wrong"));
    }
  }
}
