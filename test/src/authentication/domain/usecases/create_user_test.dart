// What does the class depends on?
// Answer -- AuthenticationRepository

// How can we create a fake version of the dependency?
// Answer -- Use Mocktail

// How do we control what our dependencies do?
// Answer -- Using the Mocktail's API

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_clean_arch_example/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_clean_arch_example/src/authentication/domain/usecases/create_user.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
    // registerFallbackValue(CustomType);     For Custom Type
  });

  const params = CreateUserParams.empty();
  test('should call the [AuthRepo.createUser]', () async {
    // Arrange
    // Highjacking or Stubbing
    when(
      () => repository.createUser(
        createdAt: any(named: 'createdAt'),
        name: any(named: 'name'),
        avatar: any(named: 'avatar'),
      ),
    ).thenAnswer((invocation) async => const Right(null));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(const Right<dynamic, void>(null)));

    verify(() => repository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar,
        )).called(1);

    verifyNoMoreInteractions(repository);
  });
}
