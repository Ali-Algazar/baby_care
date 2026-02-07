import 'package:baby_care/features/medicine/data/repositories/medicine_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit(this.medicineRepository) : super(MedicineInitial());
  final MedicineRepository medicineRepository;

  Future<void> getAllMedicines() async {
    emit(MedicineLoading());
    final result = await medicineRepository.getAllMedicines();
    result.fold((failure) => emit(MedicineError(failure.message)), (medicines) {
      if (medicines.isEmpty) {
        emit(MedicineEmpty());
      } else {
        emit(MedicineLoaded(medicines));
      }
    });
  }
}
