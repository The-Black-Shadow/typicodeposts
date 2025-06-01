import 'package:typicodeposts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (response.statusCode == 200) {
      return postsFromJson(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
