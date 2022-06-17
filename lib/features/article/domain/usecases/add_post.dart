import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';
import '../repositories/posts_repositories.dart';

class AddPostUseCase {
  final PostRepositories repositories;

  AddPostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(Post post) async{
    return await repositories.addPost(post);
  }
}
