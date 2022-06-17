import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/features/article/data/models/post_model.dart';

abstract class PostLocalDataSource {

  Future<List<PostModel>> getAllCachedPost();

  Future<Unit> addCachedPosts(List<PostModel> list);

}