import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/features/article/domain/repositories/posts_repositories.dart';
import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';

class GetAllPostsUseCase {

  final PostRepositories repositories;
  GetAllPostsUseCase(this.repositories);

  Future<Either<Failure, List<Post>>> call() async{
    return await repositories.getAllPosts();
  }

}