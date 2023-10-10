import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_01/feature/posts/models/posts_model.dart';

class PostRepo {
  static Future<List<PostsModle>> fetchPosts() async {
    var client = http.Client();
    List<PostsModle> posts = [];
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var result = jsonDecode(response.body);
      for (int j = 0; j < result.length; j++) {
        PostsModle post =
            PostsModle.fromJson(result[j] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      // emit(PostFetchedWithErorrState());
      print(e);
      return [];
    }
  }
}
