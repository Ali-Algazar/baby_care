import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/doctors/data/model/doctor_model.dart';

abstract class DoctorsLocalDataSource {
  Future<List> getCachedDoctorsList();
  Future<void> cacheDoctorsList(List<DoctorModel> doctorsToCache);
  Future<void> clearCachedDoctorsList();
}

class DoctorsLocalDataSourceImpl implements DoctorsLocalDataSource {
  @override
  Future<void> cacheDoctorsList(List<DoctorModel> doctorsToCache) async {
    for (var doctor in doctorsToCache) {
      await HiveHelper.putData(
        boxName: Constants.kDoctorsBox,
        key: doctor.id,
        value: doctor,
      );
    }
  }

  @override
  Future<void> clearCachedDoctorsList() async {
    await HiveHelper.clearBox(Constants.kDoctorsBox);
  }

  @override
  Future<List<dynamic>> getCachedDoctorsList() async {
    final data = await HiveHelper.getAllValues(Constants.kDoctorsBox);
    return data;
  }
}
