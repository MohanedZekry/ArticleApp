import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/features/article/domain/repositories/posts_repositories.dart';
import '../../../../core/error/failure.dart';

class DeletePostUseCase {
  final PostRepositories repositories;

  DeletePostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(int id) async{
    return await repositories.deletePost(id);
  }
}