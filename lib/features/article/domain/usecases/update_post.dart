import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/features/article/domain/repositories/posts_repositories.dart';
import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';

class UpdatePostUseCase {
  final PostRepositories repositories;

  UpdatePostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(Post post) async{
    return await repositories.updatePost(post);
  }
}