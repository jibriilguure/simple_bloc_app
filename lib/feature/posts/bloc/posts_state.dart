part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

class PostActionState extends PostsState {}

class PostFetchedSuccessfulState extends PostsState {
  final List<PostsModle> posts;

  PostFetchedSuccessfulState({required this.posts});
}

class PostFetchingLoadingState extends PostsState {}

class PostFetchedWithErorrState extends PostsState {}
