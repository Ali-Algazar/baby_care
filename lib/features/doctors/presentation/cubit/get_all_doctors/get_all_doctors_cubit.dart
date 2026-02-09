import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/features/doctors/data/model/doctor_model.dart';
import 'package:baby_care/features/doctors/data/repositories/doctors_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  GetAllDoctorsCubit(this.doctorsRepository) : super(GetAllDoctorsInitial());
  final DoctorsRepository doctorsRepository;
  final CancelToken cancelToken = CancelToken();

  Future<void> getAllDoctors() async {
    safeEmit(GetAllDoctorsLoading());
    final result = await doctorsRepository.getAllDoctors(cancelToken);
    result.fold((failure) => safeEmit(GetAllDoctorsError(failure.message)), (
      doctors,
    ) {
      if (doctors.isEmpty) {
        safeEmit(GetAllDoctorsEmpty());
      } else {
        safeEmit(GetAllDoctorsSuccess(doctors as List<DoctorModel>));
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    cancelToken.cancel();
    return super.close();
  }
}
