import 'dart:io';

import 'package:baby_care/core/errors/failures.dart';
import 'package:baby_care/features/sounds/data/datasources/sounds_local_data_source.dart';
import 'package:baby_care/features/sounds/data/datasources/sounds_remote_data_source.dart';
import 'package:baby_care/features/sounds/data/model/sound_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'sounds_repository.dart';

class SoundsRepositoryImpl implements SoundsRepository {
  final SoundsRemoteDataSource remoteDataSource;
  final SoundsLocalDataSource localDataSource;
  final Connectivity connectivity;

  SoundsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, List<SoundModel>>> fetchSounds() async {
    try {
      if (await hasConnection()) {
        final response = await remoteDataSource.fetchSounds();
        if (response.statusCode == 200) {
          final remoteSounds = (response.data['data'] as List)
              .map((e) => SoundModel.fromJson(e))
              .toList();
          await localDataSource.cacheSounds(remoteSounds);
          return right(remoteSounds);
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

  Future<bool> hasConnection() async {
    final results = await connectivity.checkConnectivity();
    final hasConnection =
        results.isNotEmpty && results.first != ConnectivityResult.none;

    return hasConnection;
  }
}
