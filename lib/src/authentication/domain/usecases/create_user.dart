// Actul Implementation

import 'package:equatable/equatable.dart';
import 'package:tdd_clean_arch_example/core/usecase/usecase.dart';
import 'package:tdd_clean_arch_example/core/utils/typedef.dart';
import 'package:tdd_clean_arch_example/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty()
      : this(
          createdAt: '_empty.createcAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
