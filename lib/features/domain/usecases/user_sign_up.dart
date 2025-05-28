import 'package:bloc_cleanarch/core/error/failures.dart';
import 'package:bloc_cleanarch/core/usecase/usecase.dart';
import 'package:bloc_cleanarch/features/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<String, UserSignUpParams>{
  final AuthRepository authRepository;
  UserSignUp({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async{
    return await authRepository.signUpWithEmailPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}


class UserSignUpParams{
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}