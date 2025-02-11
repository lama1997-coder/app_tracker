import 'package:app_tracker/data/repositories/auth_repository_imp.dart';
import 'package:app_tracker/domain/model/failure_model.dart';
import 'package:app_tracker/domain/entities/user_entity.dart';
import 'package:app_tracker/data/datasource/remote/remote_datasource.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:either_dart/either.dart';
import 'package:mockito/annotations.dart';

import 'auth_repository_impl_test.mocks.dart';


@GenerateMocks([AuthRemoteDataSource])
void main() {
  late AuthRepositoryImpl authRepository;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    authRepository = AuthRepositoryImpl(mockRemoteDataSource);
  });

  const email = "test@example.com";
  const password = "password123";
  final userEntity = UserEntity(uid: "12345", email: email);
  final failure = ServerFailure( "Error occurred");

  group('AuthRepositoryImpl', () {
    test('should return UserEntity on successful registration', () async {
      when(mockRemoteDataSource.register(email, password))
          .thenAnswer((_) async => Right(userEntity));

      final result = await authRepository.register(email, password);

      expect(result.isRight, true);
      expect(result.right, userEntity);
      verify(mockRemoteDataSource.register(email, password)).called(1);
    });

    test('should return FailureModel on registration failure', () async {
      when(mockRemoteDataSource.register(email, password))
          .thenAnswer((_) async => Left(failure));

      final result = await authRepository.register(email, password);

      expect(result.isLeft, true);
      expect(result.left, failure);
      verify(mockRemoteDataSource.register(email, password)).called(1);
    });

    test('should return UserEntity on successful login', () async {
      when(mockRemoteDataSource.login(email, password))
          .thenAnswer((_) async => Right(userEntity));

      final result = await authRepository.login(email, password);

      expect(result.isRight, true);
      expect(result.right, userEntity);
      verify(mockRemoteDataSource.login(email, password)).called(1);
    });

    test('should return FailureModel on login failure', () async {
      when(mockRemoteDataSource.login(email, password))
          .thenAnswer((_) async => Left(failure));

      final result = await authRepository.login(email, password);

      expect(result.isLeft, true);
      expect(result.left, failure);
      verify(mockRemoteDataSource.login(email, password)).called(1);
    });

    test('should return UserEntity if token is valid', () async {
      when(mockRemoteDataSource.isTokenValid())
          .thenAnswer((_) async => Right(userEntity));

      final result = await authRepository.isTokenValid();

      expect(result.isRight, true);
      expect(result.right, userEntity);
      verify(mockRemoteDataSource.isTokenValid()).called(1);
    });

    test('should return FailureModel if token is invalid', () async {
      when(mockRemoteDataSource.isTokenValid())
          .thenAnswer((_) async => Left(failure));

      final result = await authRepository.isTokenValid();

      expect(result.isLeft, true);
      expect(result.left, failure);
      verify(mockRemoteDataSource.isTokenValid()).called(1);
    });
  });
}
