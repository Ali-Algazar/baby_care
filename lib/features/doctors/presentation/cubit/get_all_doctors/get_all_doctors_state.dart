part of 'get_all_doctors_cubit.dart';

@immutable
sealed class GetAllDoctorsState {}

final class GetAllDoctorsInitial extends GetAllDoctorsState {}

final class GetAllDoctorsLoading extends GetAllDoctorsState {}

final class GetAllDoctorsSuccess extends GetAllDoctorsState {
  final List<DoctorModel> doctors;

  GetAllDoctorsSuccess(this.doctors);
}

final class GetAllDoctorsError extends GetAllDoctorsState {
  final String message;
  GetAllDoctorsError(this.message);
}

final class GetAllDoctorsEmpty extends GetAllDoctorsState {}
