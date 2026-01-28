import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';

abstract class VaccinationLocalDataSource {
  Future<void> cacheScheduleRecordList(
    List<VaccineRecordModel> listeduleRecordList,
    String childId,
  );
  Future<List<VaccineRecordModel>> getCachedScheduleRecordList(String childId);
}

class VaccinationLocalDataSourceImpl implements VaccinationLocalDataSource {
  @override
  Future<void> cacheScheduleRecordList(
    List<VaccineRecordModel> scheduleRecordList,
    String childId,
  ) async {
    await HiveHelper.putData(
      boxName: Constants.kVaccineRecordBox,
      key: childId,
      value: scheduleRecordList,
    );
  }

  @override
  Future<List<VaccineRecordModel>> getCachedScheduleRecordList(
    String childId,
  ) async {
    var list =
        await HiveHelper.getData(
              boxName: Constants.kVaccineRecordBox,
              key: childId,
            )
            as List<VaccineRecordModel>;

    return list;
  }
}
