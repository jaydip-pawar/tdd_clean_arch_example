import 'package:tdd_clean_arch_example/core/usecase/usecase.dart';
import 'package:tdd_clean_arch_example/core/utils/typedef.dart';
import 'package:tdd_clean_arch_example/src/authentication/domain/entities/user.dart';
import 'package:tdd_clean_arch_example/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
