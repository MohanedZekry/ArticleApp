import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/core/error/exceptions.dart';
import 'package:flutter_tdd/core/error/failure.dart';
import 'package:flutter_tdd/features/article/data/data_sources/post_local_data_source.dart';
import 'package:flutter_tdd/features/article/data/data_sources/post_remote_data_source.dart';
import 'package:flutter_tdd/features/article/data/models/post_model.dart';
import 'package:flutter_tdd/features/article/domain/entities/post_entity.dart';
import 'package:flutter_tdd/features/article/domain/repositories/posts_repositories.dart';
import 'package:flutter_tdd/core/network/connection_checker.dart';

class PostRepositoryImpl implements PostRepositories {

  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final ConnectionChecker connectionChecker;

  PostRepositoryImpl(this.remoteDataSource, this.localDataSource, this.connectionChecker);

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async{
    if(await connectionChecker.isConnected){
      try{
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.addCachedPosts(remotePosts);
        return Right(remotePosts);
      } on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      try{
        final localPosts = await localDataSource.getAllCachedPost();
        return Right(localPosts);
      }on EmptyCacheException{
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async{
    final PostModel postModel = PostModel(id: post.id, title: post.title, body: post.body);
    if(await connectionChecker.isConnected){
      try {
        await remoteDataSource.addPost(postModel);
        return const Right(unit);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    if (await connectionChecker.isConnected) {
      try {
        await remoteDataSource.deletePost(id);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async{
    final PostModel postModel = PostModel(id: post.id, title: post.title, body: post.body);
    if(await connectionChecker.isConnected){
      try {
        await remoteDataSource.updatePost(postModel);
        return const Right(unit);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}