import 'dart:io';

import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/doctors/data/model/doctor_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'doctors_repository.dart';
import '../datasources/doctors_remote_data_source.dart';
import '../datasources/doctors_local_data_source.dart';

class DoctorsRepositoryImpl implements DoctorsRepository {
  final DoctorsRemoteDataSource remoteDataSource;
  final DoctorsLocalDataSource localDataSource;
  final Connectivity connectivity;

  DoctorsRepositoryImpl({
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
  Future<Either<Failure, List<dynamic>>> getAllDoctors(
    CancelToken cancelToken,
  ) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.getAllDoctors(cancelToken);
        if (response.statusCode == 200) {
          final remoteDoctors = (response.data['data'] as List)
              .map((e) => DoctorModel.fromJson(e))
              .toList();
          await localDataSource.cacheDoctorsList(remoteDoctors);
          return right(remoteDoctors);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
      }
    } on SocketException catch (e) {
      return left(ServerFailure.fromSocketException(e));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> getNearbyDoctors(
    String latitude,
    String longitude, {
    required CancelToken cancelToken,
  }) async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.getNearbyDoctors(
          latitude,
          longitude,
          cancelToken,
        );
        if (response.statusCode == 200) {
          final remoteDoctors = (response.data['data'] as List)
              .map((e) => DoctorModel.fromJson(e))
              .toList();

          return right(remoteDoctors);
        } else {
          return left(ServerFailure('Server error: ${response.statusCode}'));
        }
      } else {
        return left(NetworkFailure('No internet connection'));
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
