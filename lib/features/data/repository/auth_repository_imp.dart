 import 'package:bloc_cleanarch/core/error/exceptions.dart';
import 'package:bloc_cleanarch/core/error/failures.dart';
import 'package:bloc_cleanarch/features/data/data_source/auth_remote_data_source.dart';
import 'package:bloc_cleanarch/features/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';


class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({required String email, required String password, required String name}) async{
    try{
     final userId = await  remoteDataSource.signUpWithEmailPassword(email: email, password: password, name: name);
     return Right(userId);
    } on ServerException catch (e) {
      return Left(Failure( e.message));
    }
  }
 }