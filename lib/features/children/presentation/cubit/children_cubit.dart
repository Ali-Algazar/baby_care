import 'package:flutter_bloc/flutter_bloc.dart';
import 'children_state.dart';

class ChildrenCubit extends Cubit<ChildrenState> {
  ChildrenCubit() : super(ChildrenInitial());
}
