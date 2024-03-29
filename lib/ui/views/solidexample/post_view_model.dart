import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/datamodels/post.dart';
import 'package:stacked_example_app/services/posts_service.dart';

class PostsViewModel extends FutureViewModel<List<Post>> {
  final _postsService = locator<PostsService>();

  @override
  Future<List<Post>> futureToRun() => _postsService.getPostsForUser(3);
}

// posts_count_viewmodel.dart
class PostsCountViewModel extends BaseViewModel {
  int get postsCount => locator<PostsService>().posts.length;
}
