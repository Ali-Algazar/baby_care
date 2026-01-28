import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/vaccination/data/model/vaccine_record_model.dart';

abstract class VaccinationLocalDataSource {
  Future<void> cacheScheduleRecordList(
    List<List<VaccineRecordModel>> listeduleRecordList,
    String childId,
  );
  Future<List<List<VaccineRecordModel>>?> getCachedScheduleRecordList(
    String childId,
  );
  Future<void> cacheScheduleRecordListHome(
    List<VaccineRecordModel> listeduleRecordList,
    String childId,
  );
  Future<List<VaccineRecordModel>?> getCachedScheduleRecordListHome(
    String childId,
  );
}

class VaccinationLocalDataSourceImpl implements VaccinationLocalDataSource {
  @override
  Future<void> cacheScheduleRecordList(
    List<List<VaccineRecordModel>> scheduleRecordList,
    String childId,
  ) async {
    await HiveHelper.putData(
      boxName: Constants.kVaccineRecordBox,
      key: childId,
      value: scheduleRecordList,
    );
  }

  @override
  Future<List<List<VaccineRecordModel>>?> getCachedScheduleRecordList(
    String childId,
  ) async {
    var list = await HiveHelper.getData(
      boxName: Constants.kVaccineRecordBox,
      key: childId,
    );

    if (list == null) return null;

    return list as List<List<VaccineRecordModel>>;
  }

  @override
  Future<void> cacheScheduleRecordListHome(
    List<VaccineRecordModel> listeduleRecordList,
    String childId,
  ) async {
    await HiveHelper.putData(
      boxName: Constants.kVaccineRecordBox,
      key: '$childId-home',
      value: listeduleRecordList,
    );
  }

  @override
  Future<List<VaccineRecordModel>?> getCachedScheduleRecordListHome(
    String childId,
  ) async {
    return await HiveHelper.getData(
      boxName: Constants.kVaccineRecordBox,
      key: '$childId-home',
    );
  }
}
