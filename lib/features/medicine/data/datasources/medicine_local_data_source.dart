import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/medicine/data/model/medicine_model.dart';

abstract class MedicineLocalDataSource {
  Future<void> cacheMedicineData(List<MedicineModel> medicineData);
  Future<void> clearCachedMedicineData();
  Future<List> getCachedMedicineData();
}

class MedicineLocalDataSourceImpl implements MedicineLocalDataSource {
  @override
  Future<void> cacheMedicineData(List<MedicineModel> medicineData) async {
    for (var medicine in medicineData) {
      await HiveHelper.putData(
        boxName: Constants.kMedicineBox,
        key: medicine.id,
        value: medicine,
      );
    }
  }

  @override
  Future<void> clearCachedMedicineData() async {
    await HiveHelper.clearBox(Constants.kMedicineBox);
  }

  @override
  Future<List<dynamic>> getCachedMedicineData() async {
    final data = await HiveHelper.getAllValues(Constants.kMedicineBox);
    return data;
  }
}
