import 'package:bloc_cleanarch/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  @override
  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async{
    try{
     final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
        if (response.user != null) {
          throw ServerException("User is null");
        }
        return response.user!.id;
    }catch (e) {
      throw ServerException('Failed to sign up: $e');
    }
  }
}
