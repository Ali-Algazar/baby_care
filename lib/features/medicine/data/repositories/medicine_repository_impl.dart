import 'dart:io';

import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/medicine/data/model/medicine_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'medicine_repository.dart';
import '../datasources/medicine_remote_data_source.dart';
import '../datasources/medicine_local_data_source.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineRemoteDataSource remoteDataSource;
  final MedicineLocalDataSource localDataSource;
  final Connectivity connectivity;

  MedicineRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  Future<bool> hasConnection() async {
    final results = await connectivity.checkConnectivity();
    final hasConnection =
        results.isNotEmpty && results.first != ConnectivityResult.none;

    return hasConnection;
  }

  @override
  Future<Either<Failure, List<MedicineModel>>> getAllMedicines() async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.getAllMedicines();
        if (response.statusCode == 200) {
          final remoteMedicines = (response.data['data'] as List)
              .map((e) => MedicineModel.fromJson(e))
              .toList();
          await localDataSource.cacheMedicineData(remoteMedicines);
          return right(remoteMedicines);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        final localMedicines = await localDataSource.getCachedMedicineData();
        if (localMedicines.isNotEmpty) {
          return right(localMedicines as List<MedicineModel>);
        } else {
          return left(NetworkFailure('No internet connection'));
        }
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
