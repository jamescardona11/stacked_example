import 'dart:convert';

import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/datamodels/comment.dart';
import 'package:stacked_example_app/datamodels/post.dart';
import 'package:stacked_example_app/datamodels/user.dart';
import 'package:stacked_example_app/services/api.dart';

class UserViewModel extends FutureViewModel<User> {
  final int userId;
  UserViewModel(this.userId);

  @override
  Future<User> futureToRun() => locator<Api>().getUserProfile(userId);
}

class PostsViewModel extends FutureViewModel<List<Post>> {
  final int userId;
  PostsViewModel(this.userId);

  @override
  Future<List<Post>> futureToRun() => locator<Api>().getPostsForUser(userId);
}

class CommentsViewModel extends FutureViewModel<List<Comment>> {
  final int postId;
  CommentsViewModel(this.postId);

  @override
  Future<List<Comment>> futureToRun() => locator<Api>().getCommentsForPost(postId);
}
