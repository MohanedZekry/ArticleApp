import 'package:dartz/dartz.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource{

  Future<List<PostModel>> getAllPosts();

  Future<Unit> deletePost(int id);

  Future<Unit> updatePost(PostModel post);

  Future<Unit> addPost(PostModel post);

}

