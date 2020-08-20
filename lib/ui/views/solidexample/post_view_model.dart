import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/services/api.dart';
import 'package:stacked_example_app/services/posts_service.dart';
import 'package:stacked_example_app/ui/views/solidexample/solid_example.dart';

class PostsViewModel extends FutureViewModel<List<Post>> {
  final _postsService = locator<PostsService>();


  @override
  Future<List<Post>> futureToRun() => _postsService.getPostsForUser(3);
}

// posts_count_viewmodel.dart
class PostsCountViewModel extends BaseViewModel {
  int get postsCount => locator<PostsService>().posts.length;
}