import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/doctors/data/model/doctor_model.dart';
import 'package:baby_care/features/doctors/data/repositories/doctors_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'get_nearby_doctors_state.dart';

class GetNearbyDoctorsCubit extends Cubit<GetNearbyDoctorsState> {
  GetNearbyDoctorsCubit(this.doctorsRepository)
    : super(GetNearbyDoctorsInitial());
  final DoctorsRepository doctorsRepository;
  final CancelToken cancelToken = CancelToken();
  Future<void> getNearbyDoctors(String latitude, String longitude) async {
    safeEmit(GetNearbyDoctorsLoading());
    final result = await doctorsRepository.getNearbyDoctors(
      latitude,
      longitude,
      cancelToken: cancelToken,
    );
    result.fold((failure) => safeEmit(GetNearbyDoctorsError()), (doctors) {
      if (doctors.isEmpty) {
        safeEmit(GetNearbyDoctorsEmpty());
      } else {
        safeEmit(GetNearbyDoctorsSuccess(doctors as List<DoctorModel>));
      }
    });
  }

  @override
  Future<void> close() {
    cancelToken.cancel();
    return super.close();
  }
}
