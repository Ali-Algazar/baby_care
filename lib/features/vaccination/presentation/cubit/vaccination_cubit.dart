import 'package:baby_care/features/vaccination/data/repositories/vaccination_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'vaccination_state.dart';

class VaccinationCubit extends Cubit<VaccinationState> {
  VaccinationCubit(this.repository) : super(VaccinationInitial());
  final VaccinationRepository repository;

  Future<void> getVaccination(String id) async {
    emit(VaccinationLoading());
    final result = await repository.getVaccination(id);
    result.fold(
      (failure) => emit(VaccinationError(failure.message)),
      (vaccination) => emit(VaccinationLoaded(vaccination)),
    );
  }

  Future<void> getVaccinationHome(String id) async {
    emit(VaccinationLoading());
    final result = await repository.getVaccinationHome(id);
    result.fold(
      (failure) => emit(VaccinationError(failure.message)),
      (vaccination) => emit(VaccinationLoaded([vaccination])),
    );
  }
}
