import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_01/feature/posts/models/posts_model.dart';
import 'package:bloc_01/feature/posts/repos/post_repo.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialEvent>(postsInitialEvent);
  }

  FutureOr<void> postsInitialEvent(
      PostsInitialEvent event, Emitter<PostsState> emit) async {
    emit(PostFetchingLoadingState());
    List<PostsModle> posts = await PostRepo.fetchPosts();
    emit(PostFetchedSuccessfulState(posts: posts));
  }
}
