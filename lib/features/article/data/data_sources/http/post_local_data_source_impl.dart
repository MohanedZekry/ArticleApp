import 'package:dartz/dartz.dart';
import 'package:flutter_tdd/features/article/data/data_sources/post_local_data_source.dart';
import 'package:flutter_tdd/features/article/data/models/post_model.dart';

class PostLocalDataSourceImpl extends PostLocalDataSource {
  @override
  Future<Unit> addCachedPosts(List<PostModel> list) {
    // TODO: implement addCachedPosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllCachedPost() {
    // TODO: implement getAllCachedPost
    throw UnimplementedError();
  }
}