import 'package:injectable/injectable.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/datamodels/post.dart';

import 'api.dart';

@lazySingleton
class PostsService {
  final _api = locator<Api>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  bool get hasPosts => _posts != null && _posts.isNotEmpty;

  Future<List<Post>> getPostsForUser(int userId) async {
    _posts = await _api.getPostsForUser(userId);
    return _posts;
  }
}
