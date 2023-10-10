import 'package:bloc_01/feature/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WELCOM"),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        bloc: postsBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostFetchingLoadingState:
              return const Center(child: CircularProgressIndicator());
            case PostFetchedSuccessfulState:
              final successState = state as PostFetchedSuccessfulState;
              return Scaffold(
                body: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(successState.posts[index].body)),
                      );
                    }),
              );
            case PostFetchedWithErorrState:
              return const Center(
                  child: CircularProgressIndicator(color: Colors.red));
            default:
              return const Center(child: Text("Khalad baa jira"));
          }
        },
      ),
    );
  }
}
