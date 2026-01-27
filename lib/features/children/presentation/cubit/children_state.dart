import 'package:baby_care/features/children/data/model/child_model.dart';

abstract class ChildrenState {}

class ChildrenInitial extends ChildrenState {}

class ChildrenLoading extends ChildrenState {}

class ChildrenLoaded extends ChildrenState {
  final List<ChildModel> children;

  ChildrenLoaded({required this.children});
}

class ChildrenError extends ChildrenState {
  final String message;

  ChildrenError({required this.message});
}

class ChildrenEmpty extends ChildrenState {}
