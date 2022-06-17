import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/core/error/failure.dart';
import 'package:flutter_tdd/features/article/data/data_sources/post_local_data_source.dart';
import 'package:flutter_tdd/features/article/data/data_sources/post_remote_data_source.dart';
import 'package:flutter_tdd/features/article/domain/entities/post_entity.dart';
import 'package:flutter_tdd/features/article/domain/repositories/posts_repositories.dart';

class PostRepositoryImpl implements PostRepositories {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{
    await remoteDataSource.getAllPosts();
    await localDataSource.getAllCachedPost();
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    throw UnimplementedError();
  }

}