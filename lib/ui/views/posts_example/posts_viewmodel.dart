import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/datamodels/post.dart';
import 'package:stacked_example_app/services/posts_service.dart';

@singleton
class PostsViewModel extends FutureViewModel<List<Post>> {
  final _postsService = locator<PostsService>();

  @override
  Future<List<Post>> futureToRun() {
    print('Fetch posts');
    return _postsService.getPostsForUser(3);
  }

  void initialize() {
    debugPrint('Initialize Posts');
  }
}
