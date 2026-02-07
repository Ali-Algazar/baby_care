import 'package:baby_care/features/medicine/data/model/medicine_model.dart';

abstract class MedicineState {}

class MedicineInitial extends MedicineState {}

class MedicineLoading extends MedicineState {}

class MedicineLoaded extends MedicineState {
  final List<MedicineModel> medicines;
  MedicineLoaded(this.medicines);
}

class MedicineError extends MedicineState {
  final String message;
  MedicineError(this.message);
}

class MedicineEmpty extends MedicineState {}
