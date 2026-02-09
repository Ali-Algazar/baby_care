part of 'get_nearby_doctors_cubit.dart';

@immutable
sealed class GetNearbyDoctorsState {}

final class GetNearbyDoctorsInitial extends GetNearbyDoctorsState {}

final class GetNearbyDoctorsLoading extends GetNearbyDoctorsState {}

final class GetNearbyDoctorsSuccess extends GetNearbyDoctorsState {
  final List<DoctorModel> doctors;
  GetNearbyDoctorsSuccess(this.doctors);
}

final class GetNearbyDoctorsError extends GetNearbyDoctorsState {}

final class GetNearbyDoctorsEmpty extends GetNearbyDoctorsState {}
