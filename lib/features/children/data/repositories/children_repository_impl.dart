import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/children/data/datasources/children_local_data_source.dart';
import 'package:baby_care/features/children/data/datasources/children_remote_data_source.dart';
import 'package:baby_care/features/children/data/model/child_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'children_repository.dart';

class ChildrenRepositoryImpl implements ChildrenRepository {
  final ChildrenRemoteDataSource remoteDataSource;
  final ChildrenLocalDataSource localDataSource;
  final Connectivity connectivity;

  ChildrenRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });
  @override
  Future<Either<Failure, List<ChildModel>>> getChildren() async {
    try {
      final hasConnection1 = await hasConnection();
      if (hasConnection1) {
        var response = await remoteDataSource.getChildren();
        if (response.statusCode == 200) {
          List<ChildModel> children = (response.data as List).map((child) {
            return ChildModel.fromJson(child);
          }).toList();
          await localDataSource.cacheChildrenList(children);

          return right(await localDataSource.getCachedChildrenList());
        } else {
          return left(ServerFailure('error '));
        }
      } else {
        var listChildren = await localDataSource.getCachedChildrenList();
        return right(listChildren);
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<bool> hasConnection() async {
    final results = await connectivity.checkConnectivity();
    final hasConnection =
        results.isNotEmpty && results.first != ConnectivityResult.none;

    return hasConnection;
  }
}
