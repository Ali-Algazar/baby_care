import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/helper/hive_helper.dart';
import 'package:baby_care/features/children/data/model/child_model.dart';

abstract class ChildrenLocalDataSource {
  Future<void> cacheChildrenList(List<ChildModel> children);
  Future<List<ChildModel>> getCachedChildrenList();
  Future<void> clearChildrenList();
}

class ChildrenLocalDataSourceImpl implements ChildrenLocalDataSource {
  @override
  Future<void> cacheChildrenList(List<ChildModel> children) async {
    for (var child in children) {
      print(child);
      HiveHelper.putData(
        boxName: Constants.kChildrenBox,
        key: child.id,
        value: child,
      );
    }
  }

  @override
  Future<void> clearChildrenList() async {
    HiveHelper.clearBox(Constants.kChildrenBox);
  }

  @override
  Future<List<ChildModel>> getCachedChildrenList() async {
    var list =
        await HiveHelper.getAllValues(Constants.kChildrenBox)
            as List<ChildModel>;
    print(list);
    return list;
  }
}
