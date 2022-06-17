import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepositories {

  Future<Either<Failure, List<Post>>> getAllPosts();

  Future<Either<Failure, Unit>> deletePost(int id);

  Future<Either<Failure, Unit>> updatePost(Post post);

  Future<Either<Failure, Unit>> addPost(Post post);

}