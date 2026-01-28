abstract class VaccinationState {}

class VaccinationInitial extends VaccinationState {}

class VaccinationLoading extends VaccinationState {}

class VaccinationLoaded extends VaccinationState {
  final List<List<dynamic>> vaccinationData;

  VaccinationLoaded(this.vaccinationData);
}

class VaccinationError extends VaccinationState {
  final String message;
  VaccinationError(this.message);
}
