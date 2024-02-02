import 'package:dartz/dartz.dart';
import 'package:tdd_clean_arch_example/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
